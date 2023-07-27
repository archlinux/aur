# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=ubi_reader
pkgname=python-${_pyname//_/-}-git
pkgver=0.8.9.r2.gcc7225e
pkgrel=1
pkgdesc='Scripts for reading information about and extracting data from UBI and UBIFS images.'
arch=('any')
url="https://github.com/onekey-sec/$_pyname"
license=(GPL)
depends=(python)
conflicts=(python-ubi-reader)
provides=("python-ubi-reader=${pkgver%.r*}")
makedepends=(git python-build python-installer python-wheel python-setuptools python-poetry)
checkdepends=(python-pytest python-pytest-cov)
source=("git+https://github.com/onekey-sec/$_pyname")
sha256sums=(SKIP)

pkgver() {
  cd "$_pyname"
  git describe --long --tags | sed -E "s/v([^v]*)/\1/" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${_pyname}" clean -dfx
}

build() {
    cd "$_pyname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
