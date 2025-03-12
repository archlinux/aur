# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=python-mutagen-git
pkgver=1.47.0.r34.g62a7b3e
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://github.com/quodlibet/mutagen"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(git python-build python-wheel python-installer python-setuptools)
checkdepends=(python-pytest python-hypothesis)
provides=(python-mutagen)
conflicts=(python-mutagen)
source=("git+https://github.com/quodlibet/mutagen.git")
sha256sums=('SKIP')

pkgver() {
  cd "mutagen"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mutagen"
  python -m build --wheel --no-isolation
}

check() {
  cd "mutagen"
  pytest -v
}

package() {
  cd "mutagen"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
