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
pkgver=5.5.13
pkgrel=1
pkgdesc='Linux-libre'
rcnver=5.5.11
rcnrel=armv7-x14
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
  0003-drm-Remove-PageReserved-manipulation-from-drm_pci_al.patch
  0004-drm-i915-Serialise-i915_active_acquire-with-__active.patch
  0005-drm-i915-gem-Take-runtime-pm-wakeref-prior-to-unbind.patch
  0006-drm-i915-gem-Avoid-parking-the-vma-as-we-unbind.patch
  0007-drm-i915-gem-Try-to-flush-pending-unbind-events.patch
  0008-drm-i915-gem-Reinitialise-the-local-list-before-repe.patch
  0009-drm-i915-Add-a-simple-is-bound-check-before-unbindin.patch
  0010-drm-i915-Introduce-a-vma.kref.patch
  0011-iwlwifi-don-t-send-GEO_TX_POWER_LIMIT-if-no-wgds-tab.patch
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
            '2c882f6256bb9409b59fde28183e71701e969aab8a0e36821550a639a5c5de3e3b129a708f0f9c83135653cfccc837601850b631fb6d63449e2083319aba1d30'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            '69f01bda528c7785461e9a712ed67979446df7b817b2e7ffa07f2cfd4b7ec379eab971c0ca179320560b8f4a454cae0085fd1e0bd548803f5dc5ce1da64e550d'
            '18e7f5c57147837666326c6e1a7990acc845b91384da362cc05de0442c51fbe97a76a775ea23b5386979b0fd085a26d276f69ac5c4efdd50e69dcf3e3bc4eaf1'
            '8f26d9d2161bad45fbd5b5c7db31af7bbbbc0295b87da645179bf5f777362c49cf296fa8e55d976a41f7f68868b55469787967413c7a68278dec6f7181e5e1da'
            'aca591b5a2e838754e3c5fd2c0e50098ad54c2d0f990de5bf9cff8608e881daf0e37132294ed1a0e0a7b9e1c194c0b89f95da001d94febdb25a01c409060e3ac'
            '167bc73c6c1c63931806238905dc44c7d87c5a5c0f6293159f2133dfe717fb44081018d810675716d1605ec7dff5e8333b87b19e09e2de21d0448e447437873b'
            'bb6718984a7357c9b00c37e4788480e5b8b75018c172ecc1441bc3fc5d2d42444eb5d8c7f9d2e3a7d6fed6d03acb565e3c0559486e494c40a7fe6bd0570c9ede'
            '143dea30c6da00e504c99984a98a0eb2411f558fcdd9dfa7f607d6c14e9e7dffff9cb00121d9317044b07e3e210808286598c785ee854084b993ec9cb14d8232'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            '70858920f0ac56651347f979d5add5323b4ea5ff38e802ee43146b40d4b26ca61903d44b8763a0e9ba080017839ba3fb2f67ec15694c2fba0fd726411e8a96e9'
            '420a201f16c6e293135dae81e645817e0e4d94fe885035226437c43cdce3db192e3ffebeb423a0304f7c909b2061e85af1299c7451d15d36106e319d9ddb4acf'
            '33d558d4fdad651de93208d0e9a1c6d62f9c6b85791a24443d1b2ceb6c08da425507f3f025161d399c823b852880ef61761e71f39d22f30f03a66a8c23c36ad5'
            '3fa77a47394d5e52e0b3c6c96a8c15e755f617aaa2b68758f211103489551b6fe1dfa7082ca32fc0fbc29a9d6c70cb2c419b9484d9e67839bed7182f862bd039'
            'e75f9062f9bf4c686ced979c4789ea82788aec14f56976ee4c6213ed2af4fd6a1ce1c01c26a71f7afff9a7bc2a2051e366be6c458e413e6fff154b580202e5a0'
            '19b28696117425e13a94730c0f2edabe2d9ff741095af34c1aeee95f59f9efe9e7cb6124b61b1b31d0d0730f9431281c8d0040db0fc15a80d8028ebe29562cf4'
            '5d802cc0843ee0d66aca4b57987db2cbeaa27939322244171313ca2d01cc3591ddbbf774edbb69a61830c28560f1af3b740e86495cec600118ee565bc5784536'
            '5f7af141438bced1d0f3d858fd66d68356a979c5a3eefb1f0a21a00aabdf54d84b2b558c3e1002b6287529ccb760eebbdc9922df50e46154c807ee9e6da9e73a'
            '8e61e45373fc72877a21caf2b980cdffe36c0086a55656352043ddb11c2394ab634dea0b111454758b67b515ab6070596e227f4ae02fd7c4475d412cfce5d30b'
            '28abc78b9f63b4fe3c32779d5306a59c37ff4b8868060cb71ba4521aebcb6266509f51fb5dda17eeac4ab89d0f72e63cba1e9e5938d0fc9db00f202b9a1b845f'
            '42efbf9f7502c9470042f31c9abed0f5590c837f31a4664554fa1829e51093390c1a97bdfb50d1f88ca6bba47e15df9fbb206817a9708ebc30ef469e16a851b4')
sha512sums_armv7h=('53b5ab4baaf9e58f31e72d5395a7bbb187bc90c75c3ef00a927e282a336e2f5dfe9e54c0d4ad5ab901037ddd7d5c472ae2539f5a6d44a02105bce95b2c23269c'
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
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make htmldocs
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
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  if [ "$CARCH" = "armv7h" ]; then
    echo "Installing device tree binaries..."
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install

    # armv7h presets only work with ALL_kver=$kernver
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
  pkgdesc="$pkgdesc kernel sign for Veyron Chromebooks"
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
