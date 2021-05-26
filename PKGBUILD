# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
pkgname=gint
pkgver=2.5.0
pkgrel=2
pkgdesc='Alternative library and kernel for add-in development on fx-9860G and fx-CG50 under Linux'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/gint"
licence=('unkwown')
depends=('fxlibc' 'fxsdk' 'isl' 'openlibm-casio')
makedepends=('fxlibc' 'fxsdk' 'openlibm-casio')
conflicts=('gint-git')
options=('!buildflags' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7120a74bca179dd439e6b5478765c5988787cf3c7e7b1058d95f96d070807430')

prepare() {
  cd "${srcdir}/${pkgname}"

  # ensure a clean build
  fxsdk build-fx -c
  fxsdk build-cg -c
}

build() {
  cd "$srcdir/${pkgname}"
  fxsdk build-fx
  fxsdk build-cg
}

package() {
  cd "$srcdir/${pkgname}"
  fxsdk build-fx DESTDIR="$pkgdir" install
  fxsdk build-cg DESTDIR="$pkgdir" install
}
