# Maintainer: Popolon <popolon@popolon.org>

pkgname=('yoga')
_module='yoga'
pkgver='1.0.0'
pkgrel=5
pkgdesc="Yummy Optimizer for Gorgeous Assets"
url="https://github.com/wanadev/yoga"
depends=(python3 python-cffi python-pillow python-pycparser python-unidecode python-pyguetzli python-zopflipy assimp)
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a4e7010969602b42af2ca74c95126ee533e3cf9ea9fdaa0c5c316eec7d985f53')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    sed -i 's/--std=c++11/-Wno-error=stringop-overflow -Wno-error=array-bounds/' setup.py
    python3 setup.py build_py
    python3 yoga/model/assimp_build.py
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
