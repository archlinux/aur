pkgname=papis-zotero
pkgver=0.1.1
pkgrel=1
pkgdesc='Zotero remote server for papis'
arch=('any')
url='https://github.com/papis/papis-zotero'
license=('GPL')
depends=('python' 'papis')
source=("https://github.com/papis/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('35d6889746c280d3c64cad54408b9f3bd5333df7753d6c5479d5321090edff9c')

# template start; name=python_setup; version=1;
makedepends+=('python-setuptools')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
}
# template end;

check(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	PYTHONPATH="." python tests/test_sql.py
}
