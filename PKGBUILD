# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ecos'
_module='ecos-python'
pkgver='2.0.10'
pkgrel=1
pkgdesc="Python interface for ECOS."
url="https://github.com/embotech/ecos-python"
depends=('python-numpy'
    'python-scipy'
    'ecos'
    'suitesparse')
makedepends=('python-setuptools')
checkdepends=('python-nose')
license=('GPL3')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/embotech/ecos-python/archive/v${pkgver}.tar.gz"
    "use_external_ecos.patch")
sha256sums=('fc22c5cc7883c4a446283d28dc051c9ba0f899d497f75468fcd0bb2f29139726'
            'c929cbe71cf8a109a66cbc681c6c501c42517b44e63f88440c36e5c7ca9e3be9')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ../use_external_ecos.patch
}    

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    make version
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build_ext --inplace
    nosetests
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
