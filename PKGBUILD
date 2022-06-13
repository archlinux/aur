# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview
pkgver=0.0.3
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('any')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
        14d7b259606ca706dd96b1ca5077651f70568db6.patch)
b2sums=('4e8b138fbb2c03afe2daf865c7af40566bd7937148554ca625f4e00c5d59245961d006e03fd04407ef5ab20346f7fc1e24db8382ffe0f31d33c766c4f7e06da0'
        '9b3104eb56a545e309c40a12663969cb92d30fc226a222174c24bdd4d702236f4670db34e7f90ba5eb6ee49c7ea3180f1b4ca6a2c4cb7598f60b5f81b7811889')

prepare() {
  cd "${pkgname%-git}-$pkgver"
  patch -Np1 -i "$srcdir/14d7b259606ca706dd96b1ca5077651f70568db6.patch"
}

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
