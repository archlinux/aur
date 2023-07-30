# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Andrea Pascal <andrea@anodium.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-pygatt
_module=pygatt
pkgver=4.0.5
pkgrel=3
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
depends=('python-pexpect' 'python-pyserial')
license=('custom:partly Apache, partly MIT')
arch=('any')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        0001-Remove-dependency-on-enum-compat.patch)
sha256sums=('7f4e0ec72f03533a3ef5fdd532f08d30ab7149213495e531d0f6580e9fcb1a7d'
            '1485111d418ac0812751426bbbec76ef56f8d79b7740f41009f7f6cb7f2a1e1a')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < "${srcdir}/0001-Remove-dependency-on-enum-compat.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py check -m -s
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
