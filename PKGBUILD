# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mrhlpr-git
_pkgname=mrhlpr
pkgver=r34.8243bcb
pkgrel=1
pkgdesc="merge request helper for postmarketOS maintainers"
arch=('any')
url="https://gitlab.com/postmarketOS/mrhlpr"
license=('GPL')
depends=('python')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/postmarketOS/mrhlpr")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # package doesn't have a setup.py, so do it manually
  pythondir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  mkdir -p "$pkgdir"/"$pythondir"

  cd "$_pkgname"
  install -Dm755 mrhlpr.py "$pkgdir"/usr/bin/mrhlpr
  cp -r mrhlpr/ "$pkgdir"/"$pythondir"/mrhlpr
}
