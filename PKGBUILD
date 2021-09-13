# Maintainer: Popolon <popolon@popolon.org>

pkgname=('yoga')
_module='yoga'
pkgver='1.1.0'
pkgrel=2
pkgdesc="Yummy Optimizer for Gorgeous Assets"
url="https://github.com/wanadev/yoga"
depends=(python3 python-cffi python-pillow python-pycparser python-unidecode python-pyguetzli python-zopflipy assimp python-mozjpeg-lossless-optimization)
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dc240470806a369df29f9beeab88316df0f5bb7cc3ac092b00953cb55f0ca45e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    sed -i 's/--std=c++11/-Wno-error=stringop-overflow -Wno-error=array-bounds/' setup.py
    #python3 setup.py build_py
    #python3 yoga/model/assimp_build.py
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 #--skip-build
}
