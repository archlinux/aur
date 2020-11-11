# Maintainer: David Runge <dvzrv@archlinux.org>

_name=langdetect
pkgname=python-langdetect
pkgver=1.0.8
pkgrel=3
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('Apache')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('beade4e33abd25364ead64c30b3631615526effa7788c50e0b2bfac454e7b69a33742780f838ddf5df5292dadf0449ea8f3a4197214d84a164cbecee76020a4d')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
