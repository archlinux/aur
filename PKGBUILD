# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.11
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python' 'python-adb_shell' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-packaging' 'python-rich' 'python-tld-git>=0.12.6' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz"
        deps.patch)
sha512sums=('f7cd44a3a041f0206828c48ad757019c2da4dda31402d3a3d356b23332c60db999397e8c336d5ba74b41e2e02204322883af7abb9ce89d33b1b7a1ef495eba4e'
            '09a897e1eeb66d11a2bc5fe5dc0b9f2cd3e9c6781f4fddd91e20513fb930a7ca0e326ad86d5db03d44fa0f945fedbda33d856789678a8ff02f43f8c2c9029e12')

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
