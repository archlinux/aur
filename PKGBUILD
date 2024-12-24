# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pdf2docx
pkgname=python-${_pkgname}-git
pkgver=0.5.8.r21.gb05d1a8
pkgrel=2
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/dothinking/${_pkgname}"
license=('AGPL-3.0-only')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git -C "${srcdir}/${_pkgname}" clean -dfx
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
