# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-outdated
_module='outdated'
pkgver=0.2.0
pkgrel=2
pkgdesc="Check if a version of a PyPI package is outdated"
url="https://github.com/alexmojaki/outdated"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('bcb145e0e372ba467e998c327d3d1ba72a134b0d5a729749729df6c6244ce643'
            'dfe14f8798c400cbcc85bb4536a686c6fcf3086b3446c3f7c7054a2bcd73ca6a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
