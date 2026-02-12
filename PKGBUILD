# Maintainer: whiteman808 <whiteman808@paraboletancza.org>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: André Silva <emulatorman@hyperbola.info>
# Contributor: Márcio Silva <coadde@hyperbola.info>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Contributor: Luke R. <g4jc@openmailbox.org>
# Contributor: Andreas Grapentin <andreas@grapentin.org>

# Based on linux-lts package

_replacesarchkernel=(linux%) # '%' gets replaced with kernel suffix
_replacesoldkernels=() # '%' gets replaced with kernel suffix
_replacesoldmodules=() # '%' gets replaced with kernel suffix

pkgbase=linux-libre-lts
pkgver=6.12.69
pkgrel=1
pkgdesc='LTS Linux-libre'
url='https://linux-libre.fsfla.org/'
arch=(i686 x86_64 armv7h)
makedepends=(
  bc
  cpio
  gettext
  libelf
  'pahole>=1.30' # minimun version required for vmlinux.h
  perl
  python
  tar
  xz

  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  python-yaml
  texlive-latexextra
)
options=(
  !debug
  !strip
)
_srcname="linux-${pkgver}"
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_srcname##*-}-gnu/linux-libre-${_srcname##*-}-gnu.tar.xz"{,.sign}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}{,.sig}
  config.i686 config.x86_64 config.armv7h    # the main kernel config files
  linux-armv7h.preset                        # armv7h preset file for mkinitcpio ramdisk

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
  # Arch Linux patches
  # https://gitlab.archlinux.org/archlinux/packaging/packages/linux-lts
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-Default-to-maximum-amount-of-ASLR-bits.patch
  0003-skip-simpledrm-if-nvidia-drm.modeset\=1-is.patch
)
source_i686=(
  # avoid using zstd compression in ultra mode (exhausts virtual memory)
  no-ultra-zstd.patch
)
validpgpkeys=(
  474402C8C582DAFBE389C427BCB7CF877E7D47A7 # Alexandre Oliva
  6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78 # David P.
)
sha256sums=('c57eb1d26a7cb50363588ae68fec7097a8d2df69a5c176b9bdfd1603192c4e46'
            'SKIP'
            'bfd4a7f61febe63c880534dcb7c31c5b932dde6acf991810b41a939a93535494'
            'SKIP'
            '6de8a8319271809ffdb072b68d53d155eef12438e6d04ff06a5a4db82c34fa8a'
            'SKIP'
            '13bd7a8d9ed6b6bc971e4cd162262c5a20448a83796af39ce394d827b0e5de74'
            'SKIP'
            '4112d57e8cdad8b946db4b4741a00791895fd8dc7a8c38cc7d3c91d1dac9c631'
            'e09ddcf20c28568a8b91d87d5eb4688af4b6a1dbf33772319260f4ecfb706d18'
            'b85577f769a07d09403fe748b48cb87aa3a9ea30850235b6d4ec771d775b2c43'
            '36fece52ce8dd219f15d572a5ca48d0f10956ff04376f05a5e719f23e2639c8a'
            '0376bd5efa31d4e2a9d52558777cebd9f0941df8e1adab916c868bf0c05f2fc3'
            '351fd96be8cd5ebd0435c0a8a978673fc023e3b1026085e67f86d815b2285e25'
            '3cf389ced2b40e6457421cb27892bf126b73032fbf1de895ecc37b13d981a17c'
            '423b2c6fbc8d6df79997550bef1b1e4f6f402b668007d150013623a83a12b49e'
            '596f8e0aef1df72a84685e8f2b8a9dde7e33b513de555fae6069ba652cbd00c1')
sha256sums_i686=('a044d2ed2ac13f0435e94e567f6fd5d8380b694f74e344857ca64ef0c9424a07')
b2sums=('ae4a8595b3ccfb57ab1190539ad96ea442ece0109babd8e66b00144bbb3cd1c9f6a8df442be96164ea2b7835c896eef7d3b7f3a7ff1eee392101cc4f1e7b0901'
        'SKIP'
        '73fee2ae5cb1ffd3e6584e56da86a8b1ff6c713aae54d77c0dab113890fc673dc5f300eb9ed93fb367b045ece8fa80304ff277fe61665eccf7b7ce24f0c045eb'
        'SKIP'
        'd02a1153a4285b32c774dca4560fe37907ccf30b8e487a681b717ed95ae9bed5988875c0a118938e5885ae9d2857e53a6f216b732b6fa3368e3c5fe08c86382c'
        'SKIP'
        '580911af9431c066bbc072fd22d5e2ef65f12d8358cec5ff5a4f1b7deebb86cef6b5c1ad631f42350af72c51d44d2093c71f761234fb224a8b9dbb3b64b8201d'
        'SKIP'
        'ff0e1cfdbae954d729c23c18366db6879eb25f2773a35faf0d010c9f3bf8e52f7526201e887d7a4ba5e001716877ce89435c64574f4162f0513ecc1117220f5c'
        'd80f1830bba939c3f132a8e1942dc3ef7508042a7015f0033cb2911a487d3d050b32324ac946c5e4c3acc8b4891e88c61ffc57004ec0f8b12634456c4c6e63c1'
        'a89308eb33cc1431e7b6237097d001a4833b75d0a3f03c3c7d97f879f7d7e31e9fabe9b5f65ee298f29bc815c8035a024282650babcdd5dfc1c7406beadc79f5'
        '271fc9608fd7a48ca52e4487a565a9c5afe9551c04369f4f35220c6d511b5da2c3e073fad3de576d1ca674b488a8b45f20948b16916b7f073846b2a2115e63fd'
        'c2214154c36900e311531bfe68184f31639f5c50fed23bc3803a7f18439b7ff258552a39f02fed0ea92f10744e17a6c55cef0ef1a98187f978fe480fb3dddc14'
        '0c7ceba7cd90087db3296610a07886f337910bad265a32c052d3a703e6eb8e53f355ab9948d72d366408d968d8ee7435084dd89bef5ed0b69355fd884c2cd468'
        'b2e1f3544470a0ded336a8d9097b879060530d795a9b60ef5d617d16c165f3ca27424529a7c464d249ab72abcaf48d65d66d96508a7b49622ab404739ae0a918'
        '01f1a8249983b1a52437843ce3566242b3ed1df03fcab98ec092982be9a4dc947ab0f932a6bc9ac84f85248dca479ebe193a6032cfd2b574dc6f5ca31a0190c5'
        '410dc8911051905c5c01b47890eeff817fc180434372864cfa9ee0d77e0ff43571b9fcc3c193d562c4dcd49511edf7c6c01dde12dd0778845d1868dc435531ea')
b2sums_i686=('e7915714b504b92155c983a30df6d97966c14520dc9eb004671003dbdecf454b061138a6d237cabe86be32ae2ea4c598cdb821cb1dd52f6a9bfe5e280bffa321')

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
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  local source=("${source[@]}")
  eval "source+=(\${source_${CARCH}[@]})"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig
  diff -u ../config.$CARCH .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname

  make htmldocs &
  local pid_docs=$!
  make all
  if [ "$(./scripts/config --state CONFIG_DEBUG_INFO_BTF)" = y ]; then
    make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  fi
  wait "${pid_docs}"
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  license=(
    'Apache-2.0 OR MIT'

    'BSD-2-Clause OR GPL-2.0-or-later'

    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'
    'BSD-3-Clause OR GPL-2.0-or-later'
    BSD-3-Clause-Clear

    GPL-1.0-or-later
    'GPL-1.0-or-later OR BSD-3-Clause'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'
    'GPL-2.0-or-later WITH GCC-exception-2.0'

    ISC

    LGPL-2.0-or-later
    'LGPL-2.1-only'
    'LGPL-2.1-only OR BSD-2-Clause'

    LGPL-2.1-or-later

    MIT
    MPL-1.1
    X11
    Zlib
  )
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-libre-firmware: firmware images needed for some devices'
    #'scx-scheds: to use sched-ext schedulers'
  )
  optdepends_x86_64=(
    'scx-scheds: to use sched-ext schedulers' # only available for x86_64
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    wireguard-lts
  )
  provides+=(
    # "${_replacesarchkernel[@]/%/=$pkgver}"
    "LINUX-ABI_VERSION=$pkgver"
  )
  conflicts+=(
    "${_replacesarchkernel[@]}"
    "${_replacesoldkernels[@]}"
    "${_replacesoldmodules[@]}"
  )
  # replaces+=(
  #   "${_replacesarchkernel[@]}"
  #   "${_replacesoldkernels[@]}"
  #   "${_replacesoldmodules[@]}"
  # )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build

  # licenses
  install -vDm 644 LICENSES/deprecated/{GPL-1.0,ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD,MIT}* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"

  if [ "$CARCH" = "armv7h" ]; then
    echo "Installing dtbs..."
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install

    # sed expression for following substitutions
    local _subst="
      s|%PKGBASE%|${pkgbase}|g
      s|%KERNVER%|$(<version)|g
    "

    # install mkinitcpio preset file
    sed "${_subst}" ../linux-armv7h.preset |
      install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  fi
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  license=(
    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'

    GPL-1.0-or-later
    'GPL-1.0-or-later WITH Linux-syscall-note'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR Linux-OpenIB OR BSD-2-Clause'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'
    '(GPL-2.0-only WITH Linux-syscall-note) AND MIT'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-2-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR CDDL-1.0'
    '(GPL-2.0-only WITH Linux-syscall-note) OR Linux-OpenIB'
    '(GPL-2.0-only WITH Linux-syscall-note) OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later WITH Linux-syscall-note'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR MIT'
    'LGPL-2.0-or-later OR BSD-2-Clause'
    'LGPL-2.0-or-later WITH Linux-syscall-note'

    ISC

    'LGPL-2.0-or-later WITH Linux-syscall-note'
    'LGPL-2.0-or-later OR BSD-2-Clause'

    LGPL-2.1-only
    'LGPL-2.1-only OR BSD-2-Clause'
    'LGPL-2.1-only OR MIT'
    'LGPL-2.1-only WITH Linux-syscall-note'

    LGPL-2.1-or-later
    'LGPL-2.1-or-later OR BSD-2-Clause'
    'LGPL-2.1-or-later WITH Linux-syscall-note'

    MIT
    Zlib
  )
  depends=(pahole)
  # provides=(
  #   "${_replacesarchkernel[@]/%/-headers=$pkgver}"
  # )
  conflicts=(
    "${_replacesarchkernel[@]/%/-headers}"
    "${_replacesoldkernels[@]/%/-headers}"
  )
  # replaces=(
  #   "${_replacesarchkernel[@]/%/-headers}"
  #   "${_replacesoldkernels[@]/%/-headers}"
  # )

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  if [[ -e tools/bpf/bpftool/vmlinux.h ]]; then
    install -Dt "$builddir" -m644 tools/bpf/bpftool/vmlinux.h
  fi
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$KARCH" -m644 arch/$KARCH/Makefile
  [ "$CARCH" != i686 ] || install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile_32.cpu
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  # required when STACK_VALIDATION is enabled
  if [[ -e tools/objtool/objtool ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [[ -e tools/bpf/resolve_btfids/resolve_btfids ]]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$KARCH" -a arch/$KARCH/include
  install -Dt "$builddir/arch/$KARCH/kernel" -m644 arch/$KARCH/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

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

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  # licenses
  install -vDm 644 LICENSES/deprecated/{ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"
  license=(
    BSD-3-Clause

    GFDL-1.1-no-invariants-or-later

    GPL-2.0-only
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR GFDL-1.1-no-invariants-or-later'
    'GPL-2.0-only OR GFDL-1.2-no-invariants-only'
    'GPL-2.0-only OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR CC-BY-4.0'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'

    'LGPL-2.1-only OR BSD-2-Clause'

    MIT
  )
  # provides=(
  #   "${_replacesarchkernel[@]/%/-docs=$pkgver}"
  # )
  conflicts=(
    "${_replacesarchkernel[@]/%/-docs}"
    "${_replacesoldkernels[@]/%/-docs}"
  )
  # replaces=(
  #   "${_replacesarchkernel[@]/%/-docs}"
  #   "${_replacesoldkernels[@]/%/-docs}"
  # )

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

  # licenses
  install -vDm 644 LICENSES/deprecated/X11 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
  "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
