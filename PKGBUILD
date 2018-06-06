# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-ecos')
_module='ecos-python'
pkgver='2.0.7'
_pkgver="${pkgver}rc2"
pkgrel=1
pkgdesc="Python interface for ECOS."
url="https://github.com/embotech/ecos-python"
depends=('python'
    'python-numpy'
    'python-scipy'
    'ecos'
    'suitesparse')
makedepends=('python-setuptools')
optdepends=('python-nose')
license=('GPL3')
arch=('x86_64')
source=("https://github.com/embotech/ecos-python/archive/${_pkgver}.tar.gz"
    "use_external_ecos.patch")
sha256sums=('aba90a898da8a3f679e6169ee02c8d604960e721a6ff591671d2695efc5bab20'
            'c929cbe71cf8a109a66cbc681c6c501c42517b44e63f88440c36e5c7ca9e3be9')

prepare() {
    cd "${srcdir}/${_module}-${_pkgver}"
    patch -p1 < ../use_external_ecos.patch
}    

build() {
    cd "${srcdir}/${_module}-${_pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${_pkgver}"
    python setup.py build_ext --inplace
    nosetests
}

package() {
    cd "${srcdir}/${_module}-${_pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
