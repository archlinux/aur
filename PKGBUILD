# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
pkgname=gint
pkgver=2.4.1
pkgrel=2
pkgdesc='Alternative library and kernel for add-in development on fx-9860G and fx-CG50 under Linux.'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/gint"
licence=('unkwown')
depends=('fxsdk' 'openlibm-casio')
makedepends=('fxsdk' 'openlibm-casio')
conflicts=('gint-git')
options=('!buildflags' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c7dec382a039f2f8308d2d0e5782d6ea0b6fd5cc3c49aae5d258d5ab306adf0f')

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
