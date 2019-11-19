pkgname=papis-zotero
pkgver=0.1.0
pkgrel=1
pkgdesc='Zotero remote server for papis'
arch=('any')
url='https://github.com/papis/papis-zotero'
license=('GPL')
depends=('python' 'papis')
source=("https://github.com/papis/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3318b0917434f335cd87668c36b24f2ab1f86ff2483cc8a289173f5ca8d85dc2')

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