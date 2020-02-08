# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (Parabola): Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor (Parabola): Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor (Parabola): Michał Masłowski <mtjm@mtjm.eu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>

# Based on linux package

_replacesarchkernel=('linux%') # '%' gets replaced with kernel suffix
_replacesoldkernels=() # '%' gets replaced with kernel suffix
_replacesoldmodules=() # '%' gets replaced with kernel suffix

pkgbase=linux-libre
pkgver=5.5.1
pkgrel=1
pkgdesc='Linux-libre'
rcnver=5.5.1
rcnrel=armv7-x6
url='https://linux-libre.fsfla.org/'
arch=(i686 x86_64 armv7h)
license=(GPL2)
makedepends=(
  bc kmod libelf
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
)
makedepends_armv7h=(uboot-tools vboot-utils dtc) # required by linux-libre-chromebook
options=('!strip')
_srcname=linux-5.5
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_srcname##*-}-gnu/linux-libre-${_srcname##*-}-gnu.tar.xz"{,.sign}
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$pkgver-gnu/patch-${_srcname##*-}-gnu-$pkgver-gnu.xz"{,.sign}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}{,.sig}
  config.i686 config.x86_64 config.armv7h    # the main kernel config files
  linux-armv7h.preset                        # armv7h preset file for mkinitcpio ramdisk
  "kernel"{.its,.keyblock,_data_key.vbprivk} # files for signing Chromebooks kernels

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
  # extracted patches from Arch Linux kernel sources
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
  0003-Btrfs-send-fix-emission-of-invalid-clone-operations-.patch
)
source_armv7h=(
  # RCN patch (CM3 firmware deblobbed and bloatware removed)
  "https://repo.parabola.nu/other/rcn-libre/patches/$rcnver/rcn-libre-$rcnver-$rcnrel.patch"{,.sig}
  # Arch Linux ARM patches
  0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch
  0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch
  0003-SMILE-Plug-device-tree-file.patch
  0004-fix-mvsdio-eMMC-timing.patch
  0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
  0006-set-default-cubietruck-led-triggers.patch
  0007-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch
  0008-ARM-dove-enable-ethernet-on-D3Plug.patch
  0009-USB-Armory-MkII-support.patch
  0010-Revert-ARM-8947-1-Fix-__arch_get_hw_counter-access-t.patch
  # ChromiumOS patches
  0001-CHROMIUM-block-partitions-efi-Add-support-for-IGNORE.patch
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
sha512sums=('187368a8fb4e04acfd7d18a024d6cdbc2841bcc06dcfbc3a053706e8512c3e3f573755228347c11bd791b296ec60eb2d67d5075ece2aef234a847e72f2b3e746'
            'SKIP'
            '21b0beeff566b1201b3411344af0d10ab543a575652ec4841ee195244b52c68c145f536a5577d782a00fbd43bbfa7f113385eda1200a52681005bf0c8ecff92c'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            'b42beec97f61bf6475e50ef30c4712fc4cf711c51a5e96f588d897fd8f1e0951b1e7007e0545c1e6f2ae9a76abd1fbeb791e8c43991ebc33f3888a53f1af69b2'
            '2500d261d3520ac68808ce916d50115aba884d80a2c2b9173f2ef459212444c54e288f26aca4f44eac6bce3ccd48fb84bcb7b13fda4f79ae57cecba81c0515fc'
            '8f26d9d2161bad45fbd5b5c7db31af7bbbbc0295b87da645179bf5f777362c49cf296fa8e55d976a41f7f68868b55469787967413c7a68278dec6f7181e5e1da'
            'f01e7925b262d2874a8a991b1f27d057356a2a384d2012b61be5a631d4e4d7cf87461c8fb9e7f183831f5a829ad204897f1f0545a52df6288a0e04a5c2e31b96'
            '167bc73c6c1c63931806238905dc44c7d87c5a5c0f6293159f2133dfe717fb44081018d810675716d1605ec7dff5e8333b87b19e09e2de21d0448e447437873b'
            'bb6718984a7357c9b00c37e4788480e5b8b75018c172ecc1441bc3fc5d2d42444eb5d8c7f9d2e3a7d6fed6d03acb565e3c0559486e494c40a7fe6bd0570c9ede'
            '143dea30c6da00e504c99984a98a0eb2411f558fcdd9dfa7f607d6c14e9e7dffff9cb00121d9317044b07e3e210808286598c785ee854084b993ec9cb14d8232'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            '3879f0d92e5a3e26386e687aaa376213e5064e2a23100baa2c6510cff357cb7c32eae700c5313a93b0881f0f40bfc224f4fa08c503a256d2bd64ef0ff6dcb2f3'
            '902a591813240e08f24ce45a0de7d5911e1364b092f5bbc5a3ce7616c4fced4cad8adfa448f864540d3e11d21f651f51ee67810dec0e75ed3b41c3666da73423'
            '701fb8ffb75c7469e9b0cbdd046ba122e4c5129ba6d78590e161084c09cbbe66b3c2b13191967db8c61942de6bad666d156ab1842672690b2e801aa398c05805')
sha512sums_armv7h=('999d5e44c19bd1cfdc8adfe63165edb358266be290fe1b4cd32385a320cd2f012447aefd71f016ccf3152f47a91787b413a360d20262ebb7aae8a88dc1436184'
                   'SKIP'
                   '4ad93d447d8671402dd7a2886b5c1329ffd5dd7b7f87e895f792ae937258c5016c7c0512ad03c4065da7520e656d0764d565171be463a378320fb210b54e3dee'
                   '780e4ce45b35b271dd3459b543681603c1f112f68d5f3500b7c01fdcac205a9d06e9ec13700e8841d4beb831e3e2dda1664a0ac38ef23bb5a47e2df0534767d7'
                   '7b5faabd9f4a766f92a285857ff750eff4ae08abb8435483ca5bc9a38c4852d373a960ed272ea35b6a055c7ca53d2f3ff869023f91b9dcd0c5adac912c16b109'
                   '1a75ee9c6a51a95f39a6cbe5b27c034b239dad232961033df0ce9ce01dea8aaa3aa819a0a6b724a468bee8b275f2d7c8a5c56992f3237a18c19cd8ecb3a930e8'
                   '42e8fa85e9aee0624a120c1260c187b6402d48334dc5db78f753ce5c4edab6d2f8c3d0bfcd65e8fc638c448c7a0ddec9c4f0f9fc6236651c30a5eba1d092453c'
                   '13e3f21591cd0952d0c29e99998edad4a594225007d3fbb2486a92c235f85246b68030dfb5d5d427cfc82627f85d60dd561add8dcc5570e431706394c14145a0'
                   'e253bc19cd306a7b435d507761f3534677136c448885e7b6bf92b5bb28e79e2aad794a0e0b0874828a75146cbeb8586df7ab052effafb8484747c4d4d43f89a4'
                   'a8203472a924b720c9f4d8eb05976028cf3ca1e595fddee1801f7594c0bef00b1cd788410b5f8fa28ee2d6ebf1403b6052334f777c53fce0b8958e8e66931d98'
                   'dfdd22d4cb803e7dd3fd3455689147c5441392001d8695993f5e7dcad02ff0b4846dd6c53a1fdb67134022ef77e6433c52d38cbbbaccb9d9d849acb8d19c854e'
                   'b1eb6025017cb5d73d330e3bf304252c8ec4ae607350d358cc2a78ac765982dec6029b94e85966c34f015d50a39e639caf27c5907bc8dd1a36a5e1f9de206f7f'
                   '7bda2ad7eb81af802873cb6764cb9c675ec50ceeb5adc487881ebc8c316cf55f836e56c2cc67494a2920e86494861db2eb924b7ff9b151ae3c5b0e493c373bf9')

_replacesarchkernel=("${_replacesarchkernel[@]/\%/${pkgbase#linux-libre}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${pkgbase#linux-libre}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${pkgbase#linux-libre}}")

case "$CARCH" in
  i686|x86_64) KARCH=x86;;
  armv7h) KARCH=arm;;
esac

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  if [ "${_srcname##*-}" != "$pkgver" ]; then
    echo "Applying upstream patch..."
    patch -Np1 < "../patch-${_srcname##*-}-gnu-$pkgver-gnu"
  fi

  echo "Adding freedo as boot logo..."
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  if [ "$CARCH" = "armv7h" ]; then
    local src_armv7h
    for src_armv7h in "${source_armv7h[@]}"; do
      src_armv7h="${src_armv7h%%::*}"
      src_armv7h="${src_armv7h##*/}"
      [[ $src_armv7h = *.patch ]] || continue
      echo "Applying patch $src_armv7h..."
      patch -Np1 < "../$src_armv7h"
    done
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig

  make -s kernelrelease > version
  echo "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd $_srcname
  if [ "$CARCH" = "armv7h" ]; then
    make zImage modules htmldocs dtbs
  else
    make bzImage modules htmldocs
  fi
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-libre-firmware: firmware images needed for some devices')
  provides=("LINUX-ABI_VERSION=$pkgver")

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  if [ "$CARCH" = "armv7h" ]; then
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install
  fi
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # armv7h presets only work with ALL_kver=$kernver
  if [ "$CARCH" = "armv7h" ]; then
    backup=("etc/mkinitcpio.d/$pkgbase.preset")

    echo "Installing mkinitcpio preset..."
    sed "s|%PKGBASE%|$pkgbase|g;s|%KERNVER%|$kernver|g" ../linux-armv7h.preset \
      | install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  fi

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$KARCH" -m644 arch/$KARCH/Makefile
  if [[ $CARCH = i686 ]]; then
    install -Dt "$builddir/arch/$KARCH" -m644 arch/$KARCH/Makefile_32.cpu
  fi
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [[ -e tools/objtool/objtool ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$KARCH" -a arch/$KARCH/include
  install -Dt "$builddir/arch/$KARCH/kernel" -m644 arch/$KARCH/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$KARCH/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  # Parabola changes
  # 
  # since we don't want to diverge too much from Arch's PKGBUILD, we'll
  # start marking our changes as such
  if [ "$CARCH" = "armv7h" ]; then
    for i in dove exynos omap2; do
      mkdir -p "$pkgdir/usr/lib/modules/$kernver/build/arch/$KARCH/mach-$i"
      cp -a arch/$KARCH/mach-$i/include "$pkgdir/usr/lib/modules/$kernver/build/arch/$KARCH/mach-$i/"
    done
    for i in omap orion samsung versatile; do
      mkdir -p "$pkgdir/usr/lib/modules/$kernver/build/arch/$KARCH/plat-$i"
      cp -a arch/$KARCH/plat-$i/include "$pkgdir/usr/lib/modules/$kernver/build/arch/$KARCH/plat-$i/"
    done
  fi
  # end of Parabola changes

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-chromebook() {
  pkgdesc="Kernel image sign for $pkgdesc - Chromebooks"
  depends=(linux-libre=$pkgver)
  provides=("${_replacesarchkernel[@]/%/-armv7-chromebook=$pkgver}")
  conflicts=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  replaces=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  install=linux-chromebook.install

  cd $_srcname

  cp ../kernel.its .
  mkimage -D "-I dts -O dtb -p 2048" -f kernel.its kernel.signed
  dd if=/dev/zero of=bootloader.bin bs=512 count=1
  echo 'console=tty0 init=/sbin/init root=PARTUUID=%U/PARTNROFF=1 rootwait rw noinitrd' > cmdline

  echo "Creating kernel sign..."
  vbutil_kernel \
    --pack vmlinux.kpart \
    --version 1 \
    --vmlinuz kernel.signed \
    --arch arm \
    --keyblock ../kernel.keyblock \
    --signprivate ../kernel_data_key.vbprivk \
    --config cmdline \
    --bootloader bootloader.bin

  echo "Installing kernel sign..."
  mkdir -p "$pkgdir/boot"
  cp vmlinux.kpart "$pkgdir/boot"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
[[ $CARCH = armv7h ]] && pkgname+=("$pkgbase-chromebook")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
