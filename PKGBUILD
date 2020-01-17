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
pkgver=5.4.12
pkgrel=1
pkgdesc='Linux-libre'
rcnver=5.4.12
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
_srcname=linux-5.4
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
  0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch
  0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch
  0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch
  0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch
  0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch
  0007-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
  0008-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch
  0009-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch
  0010-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch
  0011-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch
  0012-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch
  0013-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch
  0014-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch
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
  # ChromiumOS patches
  0001-CHROMIUM-block-partitions-efi-Add-support-for-IGNORE.patch
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
sha512sums=('0d0915133864eb031adfc6700066147dcf3e768a50a31c39754950c95ef4fd322dc701cd50af49c403ef0325adfcb07e354d5e46c1be3dcdd719a7a55c963f37'
            'SKIP'
            '9d2311e9bebc81dbd2032dd87a9f64290bd3a406701a7a83785897230c0cdc679e75fb8b5b4dc0b9bb54f5105d3101f7fcda4296a14e62f026d4882361447e1c'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            'b42beec97f61bf6475e50ef30c4712fc4cf711c51a5e96f588d897fd8f1e0951b1e7007e0545c1e6f2ae9a76abd1fbeb791e8c43991ebc33f3888a53f1af69b2'
            'a43fdc2d902b800e6fe37cc60ff95e3684e2e6d92961192ad0bd02b5dc52a98afb3a3de8e82c56e559ae794fe0feee4f072c07e818e0c66eccb2c92c660c0dd4'
            '32590362aa544dd14bae48e24e2ffa979f2ea3cd80f0bf776126002860798a8dace8413bb19545f50af4b94dbf16ba5821780cbcdd19e10c7cfc2e4d0412eb30'
            'f01e7925b262d2874a8a991b1f27d057356a2a384d2012b61be5a631d4e4d7cf87461c8fb9e7f183831f5a829ad204897f1f0545a52df6288a0e04a5c2e31b96'
            '167bc73c6c1c63931806238905dc44c7d87c5a5c0f6293159f2133dfe717fb44081018d810675716d1605ec7dff5e8333b87b19e09e2de21d0448e447437873b'
            'bb6718984a7357c9b00c37e4788480e5b8b75018c172ecc1441bc3fc5d2d42444eb5d8c7f9d2e3a7d6fed6d03acb565e3c0559486e494c40a7fe6bd0570c9ede'
            '143dea30c6da00e504c99984a98a0eb2411f558fcdd9dfa7f607d6c14e9e7dffff9cb00121d9317044b07e3e210808286598c785ee854084b993ec9cb14d8232'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            '5c12036749138b026f299b44d4968507d265ca5182c9cd975669f9810e344b9786b787b9dd9eba310f1c480b6f856ba9a3a557ec94e313ea716cffe1e588f7b5'
            '757182970d98ed04aec3d82fdde30787812ae5c0c4217a85be1a3c3d90ccfd7afe70b42a340859be517d52ab41357c12d50f46ef49701ab9673d3240969b0799'
            'f224e185269d51fb8bbe2d8148567303f39d1216afc7d5f446be07601a6d969682051880903d4d61c917fa75ecf38a557c7b383217bb064577e369f096422843'
            '061ddb48a6d574c80ec75ac686bface0f88e8e81586c36e32ac6493ba5fe9d5d4877dbb4709d3e29758adfebb9b6fe3ed0899d5a31af550d99fca5c4d6128a41'
            'cbb6e8f92c2878ed89646667cfa54b0ebf73c426c09e3a5a9a5ed5aaf68e94364d85a589f5348c10fb3e90adb978e022ce9e7b541e64eb411bdf94ed00871f8e'
            'd60a380b494c7d80f6b379a2c74f50d33251598c2c1fdf2019fd602e51f25541726cf81485eeab02b983f56ac71c751dd54471ead05c22a339b0e6589f4675fe'
            '924a5eaed5f3d51dc9f983f7b941a11a3773bab5f686d211729b855e24dd70fa1637a8483230e3b326545d362ff09c8b07e6373ea52f79848c8d47eb27edbb3a'
            '5643a9ca7b397628dc5705a28411e8a9572da9ad981e6737957b0f172a9165801633a55d10f44d81e156daccc84732ba472982c644e6e0ca091087be6086e5b6'
            '48feeee39792d80702097caf463351f30b5084c76d2baafd0b0879889dadd078eb0d9f068dfc18dc5e39630ac90c726b5b496bb7f40873e541771a00e2995a01'
            '21f258f366335867235432bc27e222fc6033007a7e36a0ec8f7b3d9868a7c1b84da48390749e9fcff5c2cb2ad2a4d3661de21638d5fbb557711eafb8bf6ab37a'
            '2230b605ae5a9e16d98992e585590efc02684dbce1f7f310174610430cc817f69fa318ed97d066241a763a6f9a28a3b9702017ca88bb97e18b405f7ee1ec3e00'
            'caea78d02fafd04334f6005a6974307e42bb808f813c9f2fe9ee4195288c77c3c1454707d1e49dfd22d6d83e53d5b8d5100de6a7537aa80425dd3a3128aee1ca'
            'a92f15fe8e0bf10c390f252197421a268f14601f35887d4d1d87b9e597feae39b9819c955be885a62cf7a882c0080f780cdfde08a2c5efc7fdd88512c0629d4d'
            '4be4ea402a7c8db3ee19aab613138edc47834861261c2ba9e5efc4162a569352dd0ef111bc3933c0f7de477dac1524111f35ae850ff0ee1c9d37cd70702ba68b')
sha512sums_armv7h=('a9728939fc256c7d74c777b5cd5c7971efb6b43161667a39ee00cda66e3973faf63c2cdd6ad606722b3e5686eb9243d67eb48a931319dbfb99fe74fb88f06c64'
                   'SKIP'
                   'b576a9c40ba59485c350f71b9234d9e71f245e25b26382bd2f67019f3309c3b5705a6020eae0a9dfccacc763fb2056a5937c0a8ff4e64f99ba1d60f0b2acb03f'
                   '85a13a274d4cbaca3ddbe8eaf883f1a1184765f8d09d6d40bb32defbe0876cb0153513e8db8671d7fc053e383ced793b74245ff29364a760e1a52bb36ebc8e85'
                   'f9ce0bb4f06be6f742d8a31384e90fdab1a4686f14d5a8845e0c341dcfa62ae59db933237174223de9b32f9d91f99125c20ede7dff664755f1d42ea0cecdefdb'
                   'b32623904f984118ebdd8ec31816885d73776ed80a68fa23925e67451f28a8f080dd8545307bb2f857435894adfa8b3db7c8a99aa02b8b3f2b5f8e3223d98a47'
                   'd114f1e69504413e81dd67684f5b1ce69aa09d5bc768c7eee96a7d6b7ec47b32cd8f02593c878b0e9091475467de36a3d7c478e34a39148fa849548f53637b84'
                   'bc0c6b1726679498393be8d4c417c62e1f356fe5c617c71ff23532652fdd5f314e5bfc6172eaca79cd4806b81031bf2f879d7d1a6050ad4c616c04e6bdf93c2a'
                   'b13bea6412580325dba0d02cf0dc712e860f659569ffcb968aa4836fdb2882448cfee4659a675a70affccae02c8d2589d80b7239eef5ae7b615162aeaa76f3bb'
                   'cff59f974651614587313674455a968ae5390a5ca825d204f0e2f8de2b422d577b007f5297a398e2afeb33ed0d324d34ad58ff4cd56e645bd4ca9a6bdc1354c5'
                   '54adbec4b6b85cda901df7d2b3eb1f517f10d3528326e60c7afa4b49ccc7cfb43b0d1f574ceb5d7d03c94a0fbcc97c0ef785258292dd26ed46728355da27332c'
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
    msg2 "Applying upstream patch..."
    patch -Np1 < "../patch-${_srcname##*-}-gnu-$pkgver-gnu"
  fi

  msg2 "Adding freedo as boot logo..."
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  if [ "$CARCH" = "armv7h" ]; then
    local src_armv7h
    for src_armv7h in "${source_armv7h[@]}"; do
      src_armv7h="${src_armv7h%%::*}"
      src_armv7h="${src_armv7h##*/}"
      [[ $src_armv7h = *.patch ]] || continue
      msg2 "Applying patch $src_armv7h..."
      patch -Np1 < "../$src_armv7h"
    done
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"
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

  msg2 "Installing boot image..."
  if [ "$CARCH" = "armv7h" ]; then
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install
  fi
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # armv7h presets only work with ALL_kver=$kernver
  if [ "$CARCH" = "armv7h" ]; then
    backup=("etc/mkinitcpio.d/$pkgbase.preset")

    msg2 "Installing mkinitcpio preset..."
    sed "s|%PKGBASE%|$pkgbase|g;s|%KERNVER%|$kernver|g" ../linux-armv7h.preset \
      | install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  fi

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
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

  msg2 "Installing headers..."
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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$KARCH/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
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

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
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

  msg2 "Creating kernel sign..."
  vbutil_kernel \
    --pack vmlinux.kpart \
    --version 1 \
    --vmlinuz kernel.signed \
    --arch arm \
    --keyblock ../kernel.keyblock \
    --signprivate ../kernel_data_key.vbprivk \
    --config cmdline \
    --bootloader bootloader.bin

  msg2 "Installing kernel sign..."
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
