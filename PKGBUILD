# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pdf2docx
pkgname=python-${_pkgname}-git
pkgver=0.5.6.r7.g288cae8
pkgrel=2
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/dothinking/${_pkgname}"
license=('GPL')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pip' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
