# Maintainer: johnjq <dev [at] johnjq (dot) com>
# Co-maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=python-uinput
pkgver=0.11.2
pkgrel=3
pkgdesc='Pythonic API to Linux uinput kernel module'
arch=('x86_64' 'aarch64')
url='https://github.com/tuomasjjrasanen/python-uinput'
license=('GPL')
depends=('python' 'glibc' 'systemd-libs')
makedepends=(python-build python-installer python-wheel)
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "pr41.patch::https://patch-diff.githubusercontent.com/raw/tuomasjjrasanen/python-uinput/pull/41.patch")
sha512sums=('50fedc43fddbb690782196af6e9e9363f73d4ec65c7d356750db0ac846dfc7cf7f98d406aaa035684f1fe7f17e02679047cccd07c9c232d1bbdc2f1fc2a8d97e'
            'a53b925d1314e24a13703f598eec4774452bfa33046d0d15a04aa70d2ddfe77ab08c6fb46e8b947adce9f3a9e8d27d0e923233e8cac66f6ab46a0d9e9a5d02ec')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/pr41.patch"
}

build() {
   cd "${pkgname}-${pkgver}"
   python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m 644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
