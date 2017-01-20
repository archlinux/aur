# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgbase=('python-ecos')
pkgname=('python-ecos')
_module='ecos-python'
pkgver='2.0.4'
pkgrel=1
pkgdesc="Python interface for ECOS."
url="https://github.com/embotech/ecos-python"
depends=('python'
    'python-numpy'
    'python-scipy'
    'ecos')
makedepends=('python-setuptools')
license=('GPL3')
arch=('i686' 'x86_64')
source=("https://github.com/embotech/ecos-python/archive/v${pkgver}.tar.gz"
    "use_external_ecos.patch")
sha256sums=('d16907b0e9f41bbe7f43c37562e0d361db1f4d2e5fc7e91125899b4fdd062790'
            '49303c5fe700ccdc06fabdab87e5a0518b495fe32a99b2062f301e15dc4a0c72')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < ../use_external_ecos.patch
}    

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
