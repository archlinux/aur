# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=jules-git
pkgver=0.3.r0.g6c392aa
pkgrel=1
pkgdesc="Statistical computing library that aims to provide R-like experience in modern C++"
arch=('any')
url="https://verri.github.io/jules/"
license=('ZLIB')
depends=('debug_assert-git' 'range-v3-git')
optdepends=('cblas: BLAS optimized functions support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/verri/jules.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/usr/include/jules"
  for module in {array,base,core,dataframe}; do
    cp -R "$srcdir/${pkgname%-git}/jules/$module" "$pkgdir/usr/include/jules/"
  done
  find "$pkgdir/usr/include/jules" -type f -not -name '*.hpp' -exec rm {} \;
  install -D -m644 "$srcdir/${pkgname%-git}/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
