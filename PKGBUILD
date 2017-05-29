# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.13.0
pkgrel=2
pkgdesc="Panel for the Xfce desktop environment"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo>=0.11.2' 'garcon>=0.5.0' 'libxfce4ui>=4.13.0' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        'fix_pkgconfig_files.patch::https://git.xfce.org/xfce/xfce4-panel/patch/?id=01df3bf6de1ec648a6821d29e1fdb3333b6d5184')


sha256sums=('757a6428ed505655c7c26c2da62b3754610cc78aef5ec0c01453a51441385806'
            '63730daaf56bb5c4eb29ab69d9a2b168789e36640a76a86da5c49e81361f2387')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i ../fix_pkgconfig_files.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk2 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
