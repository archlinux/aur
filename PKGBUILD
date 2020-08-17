# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=python-mutagen-git
pkgver=1.45.1.r1.g22b6696
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://mutagen.readthedocs.io/en/latest/"
license=(GPL2)
depends=(python-setuptools)
checkdepends=(python-pytest python-hypothesis python-pyflakes python-pycodestyle flake8)
makedepends=(git)
source=("git+https://github.com/quodlibet/mutagen.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mutagen"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mutagen"
  python setup.py build
}

check() {
  cd "${srcdir}/mutagen"
  pytest -v
}

package() {
  cd "${srcdir}/mutagen"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -vDm 644 {NEWS,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
