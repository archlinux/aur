# Maintainer: dmnmsc

pkgname=python-browsers-git
_name=browsers
pkgver=1.4.0.r5.g53e6ddf
pkgrel=1
pkgdesc="Python library for detecting and launching browsers (git version)"
arch=('any')
url="https://github.com/roniemartinez/browsers"
license=('MIT')
depends=('python' 'python-pyxdg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
provides=("python-pybrowsers=${pkgver}")
conflicts=('python-pybrowsers')
source=("git+https://github.com/roniemartinez/browsers.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
