# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.4.0
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python' 'python-adb_shell' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-packaging' 'python-rich' 'python-tld-git>=0.12.6' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz"
        deps.patch)
sha512sums=('a878536b70543dd29db5ca8ca50eecd17b58b29d2e055a6870f46a788c8db35d5168790f6dcc7d7a1893b6c88c6d9f7b347ca88edb7e339a3823e7ed50cfe5ac'
            'a58446d6d969e1f64c972a3c4bef50cef22be2f7d5a1b3032ec8beb1dd46e24836a337ceb895caaa3ceac8f7fd7cb118538833abb47fba98427a904eb8407b49')

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
