# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-bpylist2-git
_pkgname=bpylist2
pkgver=3.0.3.r3.gddb89e0
pkgrel=2
pkgdesc='Parse and Generate binary plists and NSKeyedArchiver archives'
arch=('any')
url='https://github.com/parabolala/bpylist2'
license=('MIT')
provides=('python-bpylist2')
conflicts=('python-bpylist2')
depends=('python')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("${pkgname}-latest::git+${url}.git#commit=HEAD")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}-latest"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}-latest"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-latest"
  python -m pytest -o addopts=""
}

package() {
  cd "${srcdir}/${pkgname}-latest"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
