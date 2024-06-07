# Maintainer: Dory <dory at dory dot moe>
_pkgname=nekos
pkgname="python-${_pkgname}-git"
pkgver=r19.e744f60
pkgrel=1
pkgdesc='A Python module that uses Nekos API'
arch=('any')
url='https://github.com/Nekos-life/nekos.py'
license=('GPL-3.0-only')

depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("${_pkgname}::git+https://github.com/Nekos-life/nekos.py.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir"  "$srcdir/$_pkgname"/dist/*.whl
}
