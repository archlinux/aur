# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.12
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python' 'python-adb_shell' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-packaging' 'python-rich' 'python-tld-git>=0.12.6' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz"
        deps.patch)
sha512sums=('ce412a200adedd76d413956138fd452c081347c53db7e06ab166df6fe74bc18ea3d96a9798a1f5078ae3f614aeefd137a30d30908e92396cc7c145beba1aff68'
            '6a4d2d5a92f36dc1b53b5256fbde80808d7046f036c3956133bc58bd62ff5b1fbcbc262cf6fefaebb3a3699942d735b188ae57472f8dd4ac89b11755a21c10c7')

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
