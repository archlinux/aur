# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.14
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python' 'python-adb_shell' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-packaging' 'python-rich' 'python-tld-git>=0.12.6' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz"
        deps.patch)
sha512sums=('4e5be5249be499391211d13c3fc546204371dda5f2cba62c42cd0499147f8532fe992abb5a0051a1832849552f530b82cea2a0ea22a395ac8324886b706cd172'
            '47ca5fa43e5a48703c617a1a707434638788d9fe21605b892872b1f03c25c18b8b0868f8195ce6d553e3796d26cdd692cb5102a09fe361f2a2c826f946ff4070')

prepare() {
    cd "mvt-${pkgver}"
    patch -p1 -i "$srcdir/deps.patch"
}

build() {
    cd "mvt-${pkgver}"
    python setup.py build
}

package() {
    cd "mvt-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
