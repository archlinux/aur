# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# Contains fixes to make League Of Legends work.
# One fix requires a "hacked" glibc (wine-lol-glibc on AUR).
# Some history:
# Primary bug report: https://bugs.winehq.org/show_bug.cgi?id=47198

pkgname=wine-lol
pkgver=7.14
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}
_winever=$_pkgbasever

source=(https://dl.winehq.org/wine/source/7.x/wine-$_winever.tar.xz
        "https://github.com/wine-staging/wine-staging/archive/v$_pkgbasever/wine-staging-v$_pkgbasever.tar.gz"
        "LoL-6.17+-syscall-fix.patch"
        "LoL-abi.vsyscall32-alternative_patch_by_using_a_fake_cs_segment.patch"
        "LoL-abi-vsyscall-fix.patch"
        "LoL-broken-client-update-fix.patch"
        "LoL-client-slow-start-fix.patch"
        "LoL-garena-childwindow.patch"
        "LoL-launcher-client-connectivity-fix-0001-ws2_32-Return-a-valid-value-for-WSAIoctl-SIO_IDEAL_S.patch"
        30-win32-aliases.conf)
sha512sums=('6727be4a23b1911b36c44ac8d347be1c98bb53e67101355d6ae829d14a3a0867ba83f77a52f4dbc02a35c3b513291dd4800148a31d28f50069d199fdee04b6e9'
            '40ffa7a64780a054bdace9fd5f294a45f7648f6db933ba0a74450b5412df5cc989b7aa442dcba1f185f8d0e5a7740a9508203f1ee323f26fd77867caa9d4fcb3'
            '27397de7008680f25d173bc22937f69e2bdcbf7e5706b4cf595eb90a391db425cdc5b2be672b43325433b190fbc696fc8028b3e1d69fedd76010b2c193ad7add'
            '02b2cc049c0254ed1fc1dc1dabcf50322dd1db9f0e17d5869288ee607824662a333fdae58119a7a80c93d9ab4c980a7a77a6eaf9f4a219a71e42749c5fdff064'
            '34d8cbc8a9e06ab814b96c1f25f7068b09fb15236b31f65687afc2ec0114d4f11006ede31f6ce49c00c84faeb77d86026644abf8e115e25d5561e1f49e19e8ca'
            '8960ae5e9d9dfb08e1ed9fa506cc71f62f78f195197b5293940d35fea9a9707abf42834c778a21f39533d2f59d2cb7b9b3e10e0de1ee241b0c8ffdca16724cd0'
            '5ae6b2cff7510a940a1e77edcff9f5afeb858893655adb9180823ed7000f6abd3f0504a9ea55134995a8953d9440b78bc382bb63fec7b0a21411886f45a5762c'
            'e09b1377c4d05ec38032d83f7d930929dcbab0e4a1df6073599311a2d108dbfba7192177377d7efd31e424866036786fae8448c20cbac24b619126fad006e6f7'
            '887b3531d4c74b281dbfbb7ff3d78c2546bfe8088961a6d5ac82b65ceffe94f599be8712aa565f05f2ac593a0171e32e6bcc51d3d16f17231fbc6922aa3fd57d'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')

pkgdesc="A compatibility layer for running Windows programs - Wine Tk-Glitch with League Of Legends fixes"
url="https://github.com/M-Reimer/wine-lol"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

prepare() {
  # Allow ccache to work
  mv wine-$_winever $pkgname

  # apply wine-staging patchset
  pushd wine-staging-$_pkgbasever/patches
  ./patchinstall.sh DESTDIR="$srcdir/$pkgname" --all
  popd

  # Apply League Of Legends fixes
  patch -d $pkgname -Np1 -i "$srcdir/LoL-6.17+-syscall-fix.patch"
  patch -d $pkgname -Np1 -i "$srcdir/LoL-abi.vsyscall32-alternative_patch_by_using_a_fake_cs_segment.patch"
  patch -d $pkgname -Np1 -i "$srcdir/LoL-broken-client-update-fix.patch"
  # patch -d $pkgname -Np1 -i "$srcdir/LoL-launcher-client-connectivity-fix-0001-ws2_32-Return-a-valid-value-for-WSAIoctl-SIO_IDEAL_S.patch" # Seems to be already fixed in wine
  #patch -d $pkgname -Np1 -i "$srcdir/LoL-garena-childwindow.patch" # Does not apply
  patch -d $pkgname -Np1 -i "$srcdir/LoL-client-slow-start-fix.patch"
  patch -d $pkgname -Np1 -i "$srcdir/LoL-abi-vsyscall-fix.patch"

  # Fix opencl header path
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Fix openldap 2.5+ detection
  sed 's/-lldap_r/-lldap/' -i $pkgname/configure
}

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  # Make sure everything builds for 32bit
  export CFLAGS="-m32 $CFLAGS"

  msg2 "Building Wine-32..."

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-lol \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    --without-mingw \
    --libdir=/opt/wine-lol/lib32

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib32" \
    dlldir="$pkgdir/opt/wine-lol/lib32/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
