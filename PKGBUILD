# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkg=python-docx
pkgname=${_pkg}-git
pkgver=1.1.2.r0.g0cf6d71
pkgrel=2
pkgdesc="A Python library for creating and updating Microsoft Word (.docx) files"
arch=('any')
url="https://github.com/python-openxml/python-docx"
license=('MIT')
depends=('python' 'python-lxml' 'python-typing_extensions')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-docx')
conflicts=('python-docx')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkg}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkg}"
  python -m build --wheel --no-isolation
}


package() {
  cd "${_pkg}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
