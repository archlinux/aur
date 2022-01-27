# Maintainer: Popolon <popolon@popolon.org>

pkgname=('yoga')
_module='yoga'
pkgver='1.1.2'
pkgrel=1
pkgdesc="Yummy Optimizer for Gorgeous Assets"
url="https://github.com/wanadev/yoga"
depends=(python3 python-cffi python-pillow python-pycparser python-unidecode python-pyguetzli python-zopfli assimp python-mozjpeg-lossless-optimization)
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('745d3323a462d3a8ce3b7db6777dc758120720517a85a2175000b3db1286a68b')

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
