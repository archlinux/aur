# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-strictdoc'
_name=${pkgname#python-}
pkgver='0.0.28'
pkgrel=3
pkgdesc="Software for writing technical requirements and specifications."
url="https://github.com/strictdoc-project/strictdoc"
depends=('python-datauri' 'python-docutils' 'python-reqif' 'python-textx' 'python-xlrd' 'python-xlsxwriter')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('05c53c202fcfba9c88673ac5af0d7283dec0277e62549d5ce222bc60246a96a3')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	sed -i '/python-datauri/s/, == .*//g' requirements.txt
	sed -i '/XlsxWriter/s/, == .*//g' requirements.txt
	sed -i '/MarkupSafe/s/ == .*//g' requirements.txt
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


