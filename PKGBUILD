# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-scantree'
_module=${pkgname#python-}
pkgver='0.0.3'
pkgrel=1
pkgdesc='Flexible recursive directory iterator: scandir meets glob("**", recursive=True)'
url="https://github.com/andhus/scantree"
depends=('python>=3.12'
         'python-attrs'
         'python-pathspec')
makedepends=('python-setuptools'
	     'python-versioneer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('574b4ed16b75a753c2308c9026d256f1c80173c70bccb8a4bfa94dd51b5e4144e26e4ffbeea663239a30943c1ce660ea9d208b47413b22487256fc2863497340')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-scantree/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
