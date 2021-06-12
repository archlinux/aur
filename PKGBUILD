# Maintainer: Popolon <popolon@popolon.org>

pkgname=('yoga')
_module='yoga'
pkgver='1.0.0'
pkgrel=2
pkgdesc="Yummy Optimizer for Gorgeous Assets"
url="https://github.com/wanadev/yoga"
depends=(python3 python-cffi python-pillow python-pycparser python-unidecode python-pyguetzli python--zopflipy)
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "assimp-5.0.1.tar.gz::https://github.com/assimp/assimp/archive/refs/tags/v5.0.1.tar.gz")
sha256sums=('a4e7010969602b42af2ca74c95126ee533e3cf9ea9fdaa0c5c316eec7d985f53'
            '11310ec1f2ad2cd46b95ba88faca8f7aaa1efe9aa12605c55e3de2b977b3dbfc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    if [ -e assimp/build ]; then
      rmdir assimp/build
      rmdir assimp
      ln -s ../assimp-5.0.1 assimp
    fi
    python3 setup.py build_py
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
