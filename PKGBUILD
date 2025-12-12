# Maintainer: whiteman808 <whiteman808@paraboletancza.org>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: André Silva <emulatorman@hyperbola.info>
# Contributor: Márcio Silva <coadde@hyperbola.info>

# Based on linux-hardened package

_replacesarchkernel=('linux%') # '%' gets replaced with kernel suffix
_replacesoldkernels=() # '%' gets replaced with kernel suffix
_replacesoldmodules=() # '%' gets replaced with kernel suffix

pkgbase=linux-libre-hardened
pkgver=6.17.11.hardened1
pkgrel=1
pkgdesc='Security-Hardened Linux-libre'
url='https://linux-libre.fsfla.org/'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
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
_srcname=linux-6.17.11
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_srcname##*-}-gnu/linux-libre-${_srcname##*-}-gnu.tar.xz"{,.sign}
  # "https://linux-libre.fsfla.org/pub/linux-libre/releases/${pkgver%.*}-gnu/patch-${_srcname##*-}-gnu-${pkgver%.*}-gnu.xz"{,.sign}
  "https://github.com/anthraxx/linux-hardened/releases/download/${_srctag}/linux-hardened-${_srctag}.patch"{,.sig}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}{,.sig}
  config         # the main kernel config file

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
)
validpgpkeys=(
  474402C8C582DAFBE389C427BCB7CF877E7D47A7 # Alexandre Oliva
  65EEFE022108E2B708CBFCF7F9E712E59AF5F22A # Daniel Micay
  6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78 # David P.
  E240B57E2C4630BA768E2F26FC1B547C8D8172C8 # Levente Polyak
)
sha256sums=('39149733bd8ac4ca9f2af141f7fe1c8dd76dadc25279fabcaa892b2a752f6aa7'
            'SKIP'
            'c37acd04ba8a7c87b1b4b32dadcbcda26734614804f770e896f48ff1d024cfab'
            'SKIP'
            'bfd4a7f61febe63c880534dcb7c31c5b932dde6acf991810b41a939a93535494'
            'SKIP'
            '6de8a8319271809ffdb072b68d53d155eef12438e6d04ff06a5a4db82c34fa8a'
            'SKIP'
            '13bd7a8d9ed6b6bc971e4cd162262c5a20448a83796af39ce394d827b0e5de74'
            'SKIP'
            '3c384f8087c984789892dc045656d6f913b24e90e2ea7e4ff5f66596b9c0a102'
            '0376bd5efa31d4e2a9d52558777cebd9f0941df8e1adab916c868bf0c05f2fc3'
            '351fd96be8cd5ebd0435c0a8a978673fc023e3b1026085e67f86d815b2285e25')
b2sums=('ec025d870fbaecbd33c3b5462542d2d383cc7994b16518a0a5fe949d153120091601f5898402ef8fd53647f9f3412311c98aad2380e7a428a7663fb90c4eb0b1'
        'SKIP'
        'c05f6d3a264b05146d560c17f772c74448fea1122cf9d28a1461aa22438dd57248dd3e8c07dd36c991b42461123bad3174f197f406bae71891a8f2c4a3d8e08e'
        'SKIP'
        '73fee2ae5cb1ffd3e6584e56da86a8b1ff6c713aae54d77c0dab113890fc673dc5f300eb9ed93fb367b045ece8fa80304ff277fe61665eccf7b7ce24f0c045eb'
        'SKIP'
        'd02a1153a4285b32c774dca4560fe37907ccf30b8e487a681b717ed95ae9bed5988875c0a118938e5885ae9d2857e53a6f216b732b6fa3368e3c5fe08c86382c'
        'SKIP'
        '580911af9431c066bbc072fd22d5e2ef65f12d8358cec5ff5a4f1b7deebb86cef6b5c1ad631f42350af72c51d44d2093c71f761234fb224a8b9dbb3b64b8201d'
        'SKIP'
        'd5d8dde13aba6086964bd1fceca200df20d5f96f9dfb6672460dab2cd9d7a836cc5554e2c70a14fade7f095d80f30f24888dc7d6f4a80b7a6a4793b91b110db3'
        'c2214154c36900e311531bfe68184f31639f5c50fed23bc3803a7f18439b7ff258552a39f02fed0ea92f10744e17a6c55cef0ef1a98187f978fe480fb3dddc14'
        '0c7ceba7cd90087db3296610a07886f337910bad265a32c052d3a703e6eb8e53f355ab9948d72d366408d968d8ee7435084dd89bef5ed0b69355fd884c2cd468')

_replacesarchkernel=("${_replacesarchkernel[@]/\%/${pkgbase#linux-libre}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${pkgbase#linux-libre}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${pkgbase#linux-libre}}")

export KBUILD_BUILD_HOST=parabola
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  if [ "${_srcname##*-}" != "${pkgver%.*}" ]; then
    echo "Applying upstream patch..."
    patch -Np1 < "../patch-${_srcname##*-}-gnu-${pkgver%.*}-gnu"
  fi

  echo "Adding freedo as boot logo..."
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  # save extraversion as localversion to fit linux-hardened patch while keeping the original value
  awk '/^EXTRAVERSION/ {print $3}' Makefile > localversion.00-extraversion
  sed -i '/^EXTRAVERSION[[:space:]]*=/ s/=.*$/=/' Makefile

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # save extraversion as localversion after patching for correct string concatenation order
  awk '/^EXTRAVERSION/ {gsub(/arch/, "parabola", $3); print $3}' Makefile > localversion.01-extraversion
  sed -i '/^EXTRAVERSION[[:space:]]*=/ s/=.*$/=/' Makefile

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname

  make htmldocs &
  local pid_docs=$!

  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  wait "${pid_docs}"
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'linux-libre-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
    'usbctl: deny_new_usb control'
  )
  provides=(
    KSMBD-MODULE
    NTSYNC-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
  )
  provides+=(
    "${_replacesarchkernel[@]/%/=$pkgver}"
    "LINUX-ABI_VERSION=$pkgver"
  )
  conflicts+=(
    "${_replacesarchkernel[@]}"
    "${_replacesoldkernels[@]}"
    "${_replacesoldmodules[@]}"
  )
  replaces+=(
    "${_replacesarchkernel[@]}"
    "${_replacesoldkernels[@]}"
    "${_replacesoldmodules[@]}"
  )

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
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)
  provides=(
    "${_replacesarchkernel[@]/%/-headers=$pkgver}"
  )
  conflicts=(
    "${_replacesarchkernel[@]/%/-headers}"
    "${_replacesoldkernels[@]/%/-headers}"
  )
  replaces=(
    "${_replacesarchkernel[@]/%/-headers}"
    "${_replacesoldkernels[@]/%/-headers}"
  )

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

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

  # echo "Installing Rust files..."
  # install -Dt "$builddir/rust" -m644 rust/*.rmeta
  # install -Dt "$builddir/rust" rust/*.so

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
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
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"
  provides=(
    "${_replacesarchkernel[@]/%/-docs=$pkgver}"
  )
  conflicts=(
    "${_replacesarchkernel[@]/%/-docs}"
    "${_replacesoldkernels[@]/%/-docs}"
  )
  replaces=(
    "${_replacesarchkernel[@]/%/-docs}"
    "${_replacesoldkernels[@]/%/-docs}"
  )

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
