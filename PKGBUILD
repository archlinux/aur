# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (Parabola): Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor (Parabola): Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor (Parabola): Michał Masłowski <mtjm@mtjm.eu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>

# Based on linux package

pkgbase=linux-libre         # Build stock kernel
#pkgbase=linux-libre-custom # Build kernel with a different name
_srcbasever=4.18-gnu
_srcver=4.18.9-gnu

_replacesarchkernel=('linux%') # '%' gets replaced with _kernelname
_replacesoldkernels=() # '%' gets replaced with _kernelname
_replacesoldmodules=() # '%' gets replaced with _kernelname

_srcname=linux-${_srcbasever%-*}
_archpkgver=${_srcver%-*}
pkgver=${_srcver//-/_}
pkgrel=2
rcnrel=armv7-x9
arch=(i686 x86_64 armv7h)
url="https://linux-libre.fsfla.org/"
license=(GPL2)
makedepends=(xmlto kmod inetutils bc libelf python-sphinx graphviz)
options=('!strip')
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$_srcbasever/linux-libre-$_srcbasever.tar.xz"{,.sign}
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$_srcver/patch-$_srcbasever-$_srcver.xz"{,.sign}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm"{,.sig}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm"{,.sig}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm"{,.sig}
  # the main kernel config files
  'config.i686' 'config.x86_64' 'config.armv7h'
  # pacman hooks for depmod and initramfs regeneration
  '60-linux.hook' '90-linux.hook'
  # standard config files for mkinitcpio ramdisk
  'linux.preset'
  # armv7h patches
  "https://repo.parabola.nu/other/rcn-libre/patches/${_srcver%-*}/rcn-libre-${_srcver%-*}-$rcnrel.patch"{,.sig}
  '0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch'
  '0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch'
  '0003-SMILE-Plug-device-tree-file.patch'
  '0004-fix-mvsdio-eMMC-timing.patch'
  '0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
  '0006-set-default-cubietruck-led-triggers.patch'
  '0007-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch'
  '0008-ARM-dove-enable-ethernet-on-D3Plug.patch'
  '0009-power-add-power-sequence-library.patch'
  '0010-usb-core-add-power-sequence-handling-for-USB-devices.patch'
  '0011-ARM-dts-imx6qdl-Enable-usb-node-children-with-reg.patch'
  '0012-ARM-dts-imx6qdl-udoo.dtsi-fix-onboard-USB-HUB-proper.patch'
  '0013-ARM-dts-imx6q-evi-Fix-onboard-hub-reset-line.patch'
  '0014-ARM-mvebu-declare-asm-symbols-as-character-arrays-in.patch'
  # other patches
  '0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch'
  '0002-fix-Atmel-maXTouch-touchscreen-support.patch'
  '0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch'
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
sha512sums=('0c221c6e84eb5bc270ef79454bf407079daed84534afb1d449d40fa46e42868a471d3063016a4eb3f68d42879e18ee314ab30716116805fee35b5084b23df2a9'
            'SKIP'
            '72486a515539b2420daa6fb41c41f5994dbc4572bdacd80f75fb965398b6e12ed06c491ddab263adc36c5d48da52e1b5cf1145f4f808665dffc64ba16bfc90d4'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            'c5562a0185d184e4889e3709e7f5f6142fcb687fdbe4ff2a85c7e6dfc445b4bf4a01adf82e931941dad8f3ca3a8be6a3e23f46362be11a33e8b61eb043e2769f'
            'd9c5471ae74ba01661951e328b9d1bee937ed507dc43c1ed9678bc80429e9cbec40b317e7d636a7194dfc25e355e2f6f8316045ac38c8a6eaa3db706ad50c416'
            '6d80dd0352e2e99b6537adeb6d077004aa4d5c8c832efd80fd2c9e36d9fa3c75e3190d22678644e856e422862d226a8fac2a65c558454602c5da98a267a437f2'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '41d00af3409e8ae91aa0423ef73a5d4c5ed4ba4e2244ef37d8b8a3c8d4e379c26e45fef21274d8e2c795ef545a3212b735fc1b5b5a8b6338c8a72ca29c5167c0'
            'SKIP'
            '8a12b4477f716214266b83785335515bc0d1b1ee5c728803945e0db613caca2df02939a681716cbb51039f9a003c7e7048d882271691fd8c20f273a4a8b78f01'
            '47838b54f76595fd0dda8699bccf55aeefbe9031da965b50fadf2a8f8bb34c2e12b8c4b29cca5f6e6b3ce2704464dc1966565185641ab1b64ce2575591a79de7'
            '067ed33621353496c19b88746b9b1ab875e8a1bde3954f4aa4e8c353389e0d15551e4edaa173e98f8dfe48877b7edec40abc68f423511dcaf5db81d998560acf'
            'cec08c029509c6c07f1addb6ac1338b61ded296eac5dd3d66449429090ae0743a09cf93d8da46082784e463ee44d42fea669d362cec8ef36aa0527a0a20f1271'
            '4cd1491b69a130f7e0a2bf93c542f962e50ed2b727a96b71bfe5c2444db1abf5dba559135feecc3c02e122f717a71982d73f7432fefa9da309ce2406add591e5'
            '796e6808297a9e037c9a8912d796347f83d2c17e0162920a792216e3d6ef0e860a93c1a2c41797f1fa59cbbcaa2ace7a088ebc36dcb699ee17b95a47e39f2dda'
            '41a5f8d2fd1d82fac38afb8b15631d35d9a15f779cf60963943af2807b8caf40461e212bd0081b46dd39e08d3a4ad94910700ab4bee8460fe99d725a22f7b1e2'
            'e18ab92d1c4fcc9782ad9fdb456d3be397e17f9ec5e897242ba891c9cbb738bc616981447a7593bb907c5dd231035b000282e0e6f522cd6921a200d3b089aec8'
            '85551c55a66885d765808ceb2c7f31cd911ec7c42212a7801883cee35881171de4d26d053d6c62cbec4474c437061e05ac5857b5038e64b7c14e7df3bb5985b1'
            'a690b4ae030fe9657b2629bbe8d38b74415db06f293d0413c74b5ef88f85693f61926ff9b83fbd099ae25a11bf03b9f7cdf947ae2c52434282b3a583b280d78c'
            '28d26ca6ffc095cac0574fadb7621ea0674d542deee3bb03d251ee3a6597107002cd24d88850ca9e0a987438c86b4c61b0d146d09f29bf57ca21f04e733b6865'
            'e1b00e33bcdbc663041df21a2fa84743eebaf904204ea9b7458e4dde7bc61b17faa22c09038283e26291458427ebd9a53bf463b1bc8bc28d147d1a186426b232'
            'c3a3ceed29b8513f478cad877507c7d2171453d24346c4d62ebf34c3f35ed13ebce2ca6f7200e97693ea900f504528685fe5b59c641ccfe36bc9bc257106f157'
            '073c48fea2989334451b9020e8151c0385b07affcb2bc5f778fd5f9d2d8182e40dcd04edde4d53648c1ed8cea4721afc04267a72e429be3612d2f77f5d0fd459'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            '78b8020105e7aafb84f32de6a7fb12b5dcb466f1d36d5188d78064d3d11a2a996a7ea4c7f9ba8a927fb9e4bbbfc6ac2913d03aa8b8257d8a771a93b7b8658092')

_kernelname=${pkgbase#linux-libre}
_replacesarchkernel=("${_replacesarchkernel[@]/\%/${_kernelname}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${_kernelname}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${_kernelname}}")

case "$CARCH" in
  i686|x86_64) KARCH=x86;;
  armv7h) KARCH=arm;;
esac

prepare() {
  cd $_srcname

  # add upstream patch
  if [ "$_srcbasever" != "$_srcver" ]; then
    patch -p1 -i ../patch-$_srcbasever-$_srcver
  fi

  if [ "$CARCH" = "armv7h" ]; then
    # RCN patch (CM3 firmware deblobbed and AUFS/WireGuard removed)
    # Note: For stability reasons, AUFS has been removed in the RCN patch.
    # We are supporting AUFS in linux-libre-pck through PCK patch.
    # See https://wiki.parabola.nu/PCK for further details.
    patch -p1 -i ../rcn-libre-${_srcver%-*}-$rcnrel.patch

    # ALARM patches
    patch -p1 -i ../0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch
    patch -p1 -i ../0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch
    patch -p1 -i ../0003-SMILE-Plug-device-tree-file.patch
    patch -p1 -i ../0004-fix-mvsdio-eMMC-timing.patch
    patch -p1 -i ../0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
    patch -p1 -i ../0006-set-default-cubietruck-led-triggers.patch
    patch -p1 -i ../0007-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch
    patch -p1 -i ../0008-ARM-dove-enable-ethernet-on-D3Plug.patch
    patch -p1 -i ../0009-power-add-power-sequence-library.patch
    patch -p1 -i ../0010-usb-core-add-power-sequence-handling-for-USB-devices.patch
    patch -p1 -i ../0011-ARM-dts-imx6qdl-Enable-usb-node-children-with-reg.patch
    patch -p1 -i ../0012-ARM-dts-imx6qdl-udoo.dtsi-fix-onboard-USB-HUB-proper.patch
    patch -p1 -i ../0013-ARM-dts-imx6q-evi-Fix-onboard-hub-reset-line.patch
    patch -p1 -i ../0014-ARM-mvebu-declare-asm-symbols-as-character-arrays-in.patch
  fi

  # add freedo as boot logo
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  # Arch's linux patches
  patch -p1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  patch -p1 -i ../0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch

  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  patch -p1 -i ../0002-fix-Atmel-maXTouch-touchscreen-support.patch

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  msg2 "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig

  make -s kernelrelease > ../version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<../version)"
}

build() {
  cd $_srcname
  if [ "$CARCH" = "armv7h" ]; then
    make $MAKEFLAGS zImage modules dtbs htmldocs
  elif [ "$CARCH" = "x86_64" ] || [ "$CARCH" = "i686" ]; then
    make bzImage modules htmldocs
  fi
}

_package() {
  pkgdesc="The ${pkgbase^} kernel and modules"
  [[ $pkgbase = linux-libre ]] && groups=(base base-openrc)
  depends=(coreutils linux-libre-firmware kmod mkinitcpio)
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("${_replacesarchkernel[@]/%/=${_archpkgver}}" "LINUX-ABI_VERSION=${_srcver%%-*}")
  conflicts=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  replaces=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  backup=("etc/mkinitcpio.d/$pkgbase.preset")
  install=linux.install

  local kernver="$(<version)"

  cd $_srcname

  msg2 "Installing boot image..."
  if [ "$CARCH" = "armv7h" ]; then
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install
    cp arch/$KARCH/boot/zImage "$pkgdir/boot/vmlinuz-$pkgbase"
  elif [ "$CARCH" = "x86_64" ] || [ "$CARCH" = "i686" ]; then
    install -Dm644 "$(make -s image_name)" "$pkgdir/boot/vmlinuz-$pkgbase"
  fi

  msg2 "Installing modules..."
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"
  mkdir -p "$modulesdir"
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # a place for external modules,
  # with version file for building modules and running depmod from hook
  local extramodules="extramodules$_kernelname"
  local extradir="$pkgdir/usr/lib/modules/$extramodules"
  install -Dt "$extradir" -m644 ../version
  ln -sr "$extradir" "$modulesdir/extramodules"

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Installing hooks..."
  # sed expression for following substitutions
  if [ "$CARCH" = "armv7h" ]; then
  local subst="
    s|/boot/vmlinuz-%PKGBASE%|$kernver|g
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "
  else
  local subst="
    s|%PKGBASE%|$pkgbase|g
    s|%KERNVER%|$kernver|g
    s|%EXTRAMODULES%|$extramodules|g
  "
  fi

  # hack to allow specifying an initially nonexisting install file
  sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
  true && install=$install.pkg

  # fill in mkinitcpio preset and pacman hooks
  sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
    "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/60-$pkgbase.hook"
  sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/libalpm/hooks/90-$pkgbase.hook"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase^} kernel"
  provides=("${_replacesarchkernel[@]/%/-headers=${_archpkgver}}")
  conflicts=("${_replacesarchkernel[@]/%/-headers}" "${_replacesoldkernels[@]/%/-headers}")
  replaces=("${_replacesarchkernel[@]/%/-headers}" "${_replacesoldkernels[@]/%/-headers}")

  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 Makefile .config Module.symvers System.map vmlinux
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

  # ???
  mkdir "$builddir/.tmp_versions"

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
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase-$pkgver"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase^} kernel"
  provides=("${_replacesarchkernel[@]/%/-docs=${_archpkgver}}")
  conflicts=("${_replacesarchkernel[@]/%/-docs}" "${_replacesoldkernels[@]/%/-docs}")
  replaces=("${_replacesarchkernel[@]/%/-docs}" "${_replacesoldkernels[@]/%/-docs}")
  
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  cd $_srcname

  msg2 "Installing documentation..."
  mkdir -p "$builddir"
  cp -t "$builddir" -a Documentation

  msg2 "Removing doctrees..."
  rm -r "$builddir/Documentation/output/.doctrees"

  msg2 "Moving HTML docs..."
  local src dst
  while read -rd '' src; do
    dst="$builddir/Documentation/${src#$builddir/Documentation/output/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done < <(find "$builddir/Documentation/output" -type f -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
