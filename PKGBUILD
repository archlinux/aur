# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Fredrik Strandin <fredrik@strandin.name>

pkgname=libminizinc
pkgver=2.7.4
pkgrel=1
pkgdesc="A modelling language for constraint programming problems"
arch=(i686 x86_64)
url="https://www.minizinc.org/"
makedepends=(cmake)
depends=(gcc-libs gecode coin-or-cbc)
license=('MPL2')
conflicts=(minizinc-bin)
provides=(minizinc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MiniZinc/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('012f8b1b995d2f93c6cb67f4e1e5321e8666ae51bd38e65337f7351f76468996')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -D -m644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
