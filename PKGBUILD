# Maintainer: Marco Melletti <mellotanica@gmail.com>

pkgname=luban
pkgver=3.1.0
pkgrel=1
pkgdesc="Snapmaker 3-in-1 Software for 3D Printing, Laser Engraving and CNC Cutting."
arch=('x86_64')
url="https://snapmaker.com/"
license=('MIT')

depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'bzip2' 'cairo' 'dbus' 'e2fsprogs' 
    'expat' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gmp' 'gnutls' 
    'graphite' 'gtk3' 'harfbuzz' 'keyutils' 'krb5' 'libcups' 'libdatrie' 'libepoxy' 'libffi' 'libgcrypt' 
    'libgpg-error' 'libidn2' 'libpng' 'libtasn1' 'libthai' 'libunistring' 'libutil-linux' 'libx11' 'libxau'
    'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama'
    'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'lz4' 'nettle' 'nspr' 'nss' 'p11-kit' 'pango' 
    'pcre' 'pixman' 'systemd-libs' 'wayland' 'xz' 'zlib')

source=(
    'https://s3-us-west-2.amazonaws.com/snapmaker.com/download/luban/snapmaker-luban-3.1.0-linux-amd64.deb'
    'https://snapshot.debian.org/archive/debian/20191014T030756Z/pool/main/g/gconf/libgconf-2-4_3.2.6-6_amd64.deb'
)
md5sums=(
    '76865323e9d271bbaab03348d588be13'
    '4030a38f07ebc0a322355a160e669e65'
)
noextract=("${source[@]##*/}")

install=${pkgname}.install

prepare() {
    mkdir -p luban
    mkdir -p libgconf

    cd luban
    ar x ../snapmaker-luban-3.1.0-linux-amd64.deb
    mkdir -p data
    tar -C data -xf data.tar.xz

    cd "${srcdir}/libgconf"
    ar x ../libgconf-2-4_3.2.6-6_amd64.deb
    tar xf data.tar.xz
}

package() {
  cd "${srcdir}"
  mv luban/data/* "$pkgdir"
  mv "$(realpath libgconf/usr/lib/$CARCH-linux-gnu/libgconf-2.so.4)" "$pkgdir/opt/Snapmaker Luban/libgconf-2.so.4"
}

# vim:set ts=2 sw=2 et:
