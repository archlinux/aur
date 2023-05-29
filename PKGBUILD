# Maintainer: Rene Hollander <mail@renehollander.at>

pkgname=python-pylibzfs
pkgver=22.12.2
pkgrel=1
pkgdesc="Python libzfs bindings."
arch=("x86_64")
url="https://github.com/truenas/py-libzfs"
license=("custom")

makedepends=("python-setuptools" "cython")
depends=("zfs-utils" "python")

source=("https://github.com/truenas/py-libzfs/archive/refs/tags/TS-${pkgver}.tar.gz")
sha512sums=("568100986cec58e0e79d3024fb7d8b6a864e6f67d0f51bd63e16c2c0097d0868e4e7bbf5c63c2541158dec672bebb8285cf2ac3933054216c491b03f39041048")

build() {
    cd "${srcdir}/py-libzfs-TS-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/py-libzfs-TS-${pkgver}"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
