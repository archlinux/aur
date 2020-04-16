# Maintainer: Chris Coggburn <noderat at gmail dot com>

pkgname=yajl-edenhill-git
pkgver=r276.886c955
pkgrel=1
pkgdesc='Edenhill variant of Yet Another JSON Library'
arch=('x86_64')
url='https://github.com/edenhill/yajl/tree/edenhill'
license=('ISC')
makedepends=(cmake git)
provides=('yajl' 'yajl-edenhill')
conflicts=('yajl' 'yajl-git')
source=('git+https://github.com/edenhill/yajl#branch=edenhill')
sha256sums=('SKIP')

pkgver() {
  cd yajl
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd yajl
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd yajl
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
