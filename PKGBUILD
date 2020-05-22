# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=python-mutagen-git
pkgver=1.44.0.r14.g63b4aeb
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://mutagen.readthedocs.io/en/latest/"
license=(GPL2)
depends=(python-setuptools)
checkdepends=(python-pytest python-hypothesis python-pyflakes python-pycodestyle)
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
