# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mrhlpr-git
_pkgname=mrhlpr
pkgver=r133.336d952
pkgrel=1
pkgdesc="merge request helper for postmarketOS maintainers"
arch=('any')
url="https://gitlab.com/postmarketOS/mrhlpr"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-argcomplete' 'python-gitlab')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/postmarketOS/mrhlpr.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
