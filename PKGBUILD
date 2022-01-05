# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=gint
pkgver=2.7.0
pkgrel=1
pkgdesc='Alternative library and kernel for add-in development on fx-9860G and fx-CG50 under Linux'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/gint"
licence=('unkwown')
depends=('fxlibc' 'fxsdk' 'isl' 'openlibm-casio')
makedepends=('fxlibc' 'fxsdk' 'openlibm-casio')
conflicts=('gint-git')
options=('!buildflags' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fba31a2a4edd1d1cd12e11165255eac12e36af1aa2923605ab8b96790b328152')

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