# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus, Sergej Pupykin, Tiago Pierezan Camargo, robb_force

pkgname=nestopia
pkgver=1.51.0
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'fltk' 'zlib' 'libarchive')
makedepends=('mesa' 'autoconf-archive')
source=($pkgname-$pkgver.tar.gz::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.tar.gz")
sha256sums=('9dd3253629a05f68fb730e5bc59148cd5498cea359eff2cbf4202d1e1329bce9')
install=$pkgname.install

build() {
  cd $pkgname-$pkgver

  # build system normally disables this warning
  export CXXFLAGS="$CXXFLAGS -Wno-narrowing"

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver install DESTDIR="$pkgdir"
}
