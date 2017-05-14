# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=arc-cyberfox-theme
pkgver=20170311
_pkgver="52.$pkgver"
pkgrel=1
pkgdesc="Arc Cyberfox Theme"
url="https://github.com/horst3180/arc-firefox-theme"
arch=('x86_64' 'i686')
license=('Mozilla Public License version 2.0')
makedepends=('autoconf' 'automake' 'unzip' 'zip')

source=("$pkgname-$_pkgver::$url/archive/$_pkgver.tar.gz"
        'arc-cyberfox-theme.patch')

md5sums=('ad0d6f7ff9958c39541019aa19dc7680'
         '215f2a4de0156840da66f522cc078d2d')

prepare() {
  cd "$srcdir/arc-firefox-theme-$_pkgver"
  patch -p1 -i ../arc-cyberfox-theme.patch
}

build() {
  cd "$srcdir/arc-firefox-theme-$_pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/arc-firefox-theme-$_pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
