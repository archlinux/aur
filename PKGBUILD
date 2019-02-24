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
_srcbasever=4.20-gnu
_srcver=4.20.11-gnu

_replacesarchkernel=('linux%') # '%' gets replaced with _kernelname
_replacesoldkernels=() # '%' gets replaced with _kernelname
_replacesoldmodules=() # '%' gets replaced with _kernelname

_srcname=linux-${_srcbasever%-*}
_archpkgver=${_srcver%-*}
pkgver=${_srcver//-/_}
pkgrel=1
rcnrel=armv7-x7
arch=(i686 x86_64 armv7h)
url="https://linux-libre.fsfla.org/"
license=(GPL2)
makedepends=(xmlto kmod inetutils bc libelf python-sphinx graphviz)
makedepends_armv7h=(uboot-tools vboot-utils dtc) # for linux-libre-chromebook
options=('!strip')
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$_srcbasever/linux-libre-$_srcbasever.tar.xz"{,.sign}
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$_srcver/patch-$_srcbasever-$_srcver.xz"{,.sign}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm"{,.sig}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm"{,.sig}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm"{,.sig}
  # the main kernel config files
  config.i686 config.x86_64 config.armv7h
  # pacman hooks for depmod and initramfs regeneration
  60-linux.hook 90-linux.hook
  # standard config files for mkinitcpio ramdisk
  linux.preset
  # files for signing Chromebooks kernels
  kernel.its kernel.keyblock kernel_data_key.vbprivk
  # armv7h patches
  "https://repo.parabola.nu/other/rcn-libre/patches/${_srcver%-*}/rcn-libre-${_srcver%-*}-$rcnrel.patch"{,.sig}
  0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch
  0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch
  0003-SMILE-Plug-device-tree-file.patch
  0004-fix-mvsdio-eMMC-timing.patch
  0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
  0006-set-default-cubietruck-led-triggers.patch
  0007-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch
  0008-ARM-dove-enable-ethernet-on-D3Plug.patch
  0009-media-s5p-mfc-fix-incorrect-bus-assignment-in-virtua.patch
  # other patches
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-net-crypto-set-sk-to-NULL-when-af_alg_release.patch
  0003-exec-Fix-mem-leak-in-kernel_read_file.patch
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
sha512sums=('a4a0a25fd490c051deb32ff84ba51e8807bfc8db1ad46c22c7807e9be2e5db5e1c22c211e47fca2509d5d75d64626fb28e9bbc8ccadc565f27fe9c8e47e12dc4'
            'SKIP'
            '3cb387665734be799f3c833939f0938e17216f08aff5113a85a845dcf382d997f3574e8ea30c0fb6d5e85295106a347324c3b50858939d4568b6fa25c40a05ff'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            'ad7f1ec6f403801f2a7afc26189cecebabda227e1276fc7ed7aef58bf54e6190820ee3b9b52eb54a019573a864303f544d757b4b9e442a272930f933132ac0a9'
            'f1afd642775273e0cdc6485eab54dfd18b69a543a17aec800ff8524381cdc1185f4908dfc9b494f9130a09333c46c887c78523ad242643b868ff31223a5eccff'
            '9c34ec064a4763f238fd9721beeb3021d138ea038bd583f65eed49f49b524e2a04190e5653a8607e8613e82000cb76a8b18855ad00f644f603e39261ffb990d3'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '2718b58dbbb15063bacb2bde6489e5b3c59afac4c0e0435b97fe720d42c711b6bcba926f67a8687878bd51373c9cf3adb1915a11666d79ccb220bf36e0788ab7'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '167bc73c6c1c63931806238905dc44c7d87c5a5c0f6293159f2133dfe717fb44081018d810675716d1605ec7dff5e8333b87b19e09e2de21d0448e447437873b'
            'bb6718984a7357c9b00c37e4788480e5b8b75018c172ecc1441bc3fc5d2d42444eb5d8c7f9d2e3a7d6fed6d03acb565e3c0559486e494c40a7fe6bd0570c9ede'
            '143dea30c6da00e504c99984a98a0eb2411f558fcdd9dfa7f607d6c14e9e7dffff9cb00121d9317044b07e3e210808286598c785ee854084b993ec9cb14d8232'
            '82375afd5217b8d86a3d0da646af31330bf6bb91531e9b2462a96efb64a618e64696c4710a6bc220e9bf626dcd5c1015b6fd9b8b9c229c67a47cf58ee7aa4dd6'
            'SKIP'
            'a1d15484cc68e1ce6919ecde2172d458641bcbb4fca467d3ecb3daa576f26173574c782c89120dab4c6e0d7277aa72695ea5197db47c9ff6964cdd62991bdaeb'
            '5cc794a821e68b089a09a0083c4971d9c11a057f2cc06c39b7e0c6ba9838cd2e0f2a299a1525725f2b8e462a200e108be97c5b9015d520978e5c61fa932add12'
            'ff2b5ed0ef46b8a412ef76c0505ddfaa9f19dd8ec1dab001185ef238e5416719aff4a9b70cef52aa734f51c0bc63408082b799e8e30a9d88fc9d7fa7bbde551c'
            '4fa06537796e5408e67f9e545624ee6512cf502a06c01b231114c16d379a444f8881ce3f217efd74c646c3d75800d41cd78b815458139f592fd012a7e29a06a9'
            '6d11f0b6d07a395cb2e1517d06aeffe2a8b0593e0e5120f6ba32c61b3af381501e985579ec3dd6febe89385eba6210a5f3dac6abcc237e3ccef2668b99478b69'
            '0c749098828c4b6cccde15a6899e642520177afac8d07a83602682d43082f9b80a987f3318eb995981d6b9090e2ca0022f507a923ab669a6c78377f92e12ce00'
            '0967368a1c0ea4c409342050dfdac45a9bde3eaceac766fed1fc0b5127922484cc0d7816d29b43de7ec96634405e811787a5ebd9e09a16515cc8c1d0ac59a0f0'
            'a0915900391ab897ce2b0ab4eb6524e7ca82cf292db986548357e5d637ca39fdc9dc2cb826ced8ed6afa9bf61bb426f9da38c5a1e240132cc6e4a37f5bf121c5'
            '1834eff6ff158ae05d059e8e20d33a950ec0c4dc5fb60fd215f9e7202e9efb14231f3d5e312e826e097dff131fb399e6a9d4e8d4069a1ccf6e2966364f453c0d'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            'bac4951f03f9ec3882f1afbb3a35a5980d9e8a321056cc00294f91f0e496922a82f2403f8e99950c053866837bd7382e18cda936d9eca58bc408f6903453c89c'
            '67710358e51ffd30aaf64351e6c3542bdfa9e4e3db43ee38fca8b15357d71be3cd18db0180d196c8b2d44781ce2625e5b709d496dea0723d0616ebdfb048028a'
            'e81e85b98f126a1e298d54a289659e648582070db617194a8ed13796535341f3a052e3103ee87c4d9bd797103429b883ae2e761cb6f4b61b15f0c0fea017ff95')

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
    patch -p1 -i ../0009-media-s5p-mfc-fix-incorrect-bus-assignment-in-virtua.patch
  fi

  # add freedo as boot logo
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  # Arch's linux patches
  patch -p1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  patch -p1 -i ../0002-net-crypto-set-sk-to-NULL-when-af_alg_release.patch
  patch -p1 -i ../0003-exec-Fix-mem-leak-in-kernel_read_file.patch

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
    make zImage modules dtbs htmldocs
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
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  cd $_srcname

  msg2 "Installing boot image..."
  if [ "$CARCH" = "armv7h" ]; then
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install
  fi
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

  msg2 "Installing modules..."
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

_package-chromebook() {
  pkgdesc="Kernel image sign for ${pkgbase^} - Chromebooks"
  depends=('linux-libre')
  provides=("${_replacesarchkernel[@]/%/-armv7-chromebook=${_archpkgver}}")
  conflicts=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  replaces=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  install=linux-chromebook.install

  cd $_srcname

  msg2 "Setting options for device tree compiler..."
  cp ../kernel.its .
  mkimage -D "-I dts -O dtb -p 2048" -f kernel.its kernel.itb
  dd if=/dev/zero of=bootloader.bin bs=512 count=1
  echo 'console=tty0 init=/sbin/init root=PARTUUID=%U/PARTNROFF=1 rootwait rw noinitrd' > cmdline

  msg2 "Creating kernel sign..."
  vbutil_kernel \
    --pack vmlinux.kpart \
    --version 1 \
    --vmlinuz kernel.itb \
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
