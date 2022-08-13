# Maintainer: Rene Hollander <mail@renehollander.at>

pkgname=python-pylibzfs
pkgver=22.02.3
pkgrel=1
pkgdesc="Python libzfs bindings."
arch=("x86_64")
url="https://github.com/truenas/py-libzfs"
license=("custom")

makedepends=("python-setuptools" "cython")
depends=("zfs-utils" "python")

source=("https://github.com/truenas/py-libzfs/archive/refs/tags/TS-${pkgver}.tar.gz")
sha512sums=("8ab05e780529d0956963488b6de0a766e605bcfb99b829a842d14b81e4bd6862c1b57bfd927824341006b299da10f6188b48d7a99460bfa21ac617d752f58a40")

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
