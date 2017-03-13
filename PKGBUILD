# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastcache')
_module='fastcache'
pkgver='1.0.2'
pkgrel=1
pkgdesc="C implementation of Python 3 functools.lru_cache."
url="https://github.com/pbrady/fastcache"
checkdepends=('python-pytest')
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/fb/98/93f2d36738868e8dd5a8dbfc918169b24658f63e5fa041fe000c22ae4f8b/fastcache-1.0.2.tar.gz"
    "LICENSE")
sha256sums=('867005774917f999854ffd303fbe3793c30c2dc9279b78ec315dd4e57e4284e6'
            '023e92e0b6343c75e6912abd5076ea28b520ca27d1cd44497bcf363b9b8f559d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest
}

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
