# Maintainer: budRich <at budlabs>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: nbvcxz (b4283)

pkgname=l3afpad-budlabs
_pkgname=${pkgname%-*}
pkgver=2022.07.06.1
pkgrel=6
pkgdesc='Simple plain text editor for GTK 3 (budlabs fork)'
arch=('x86_64')
url='https://github.com/budRich/l3afpad'
license=('GPL2')
depends=('gtk3')
makedepends=('intltool')
conflicts=(l3afpad)
provides=(l3afpad)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'l3afpad.appdata.xml')
sha256sums=('4ee3cde9fca76e46553d1032ef3bceb95d6f90ba4753066b70919ae01a143f77'
            '742e3d2d23e6bad8f56dccafdccc6c1b36cebdb7dd178b1f19942fcb37fe3ff8')

prepare() {
  cd $_pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-print --disable-statistics
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$_pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
  rm -r "$pkgdir/usr/share/pixmaps/"
}
