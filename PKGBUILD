# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pypcap
pkgver=1.2.3
pkgrel=3
pkgdesc="Python libpcap module"
arch=('x86_64')
url="https://github.com/pynetwork/pypcap"
license=('custom')
depends=('python' 'libpcap')
makedepends=('python-build' 'python-installer' 'python-wheel' 'cython')
source=("https://github.com/pynetwork/pypcap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f707c8e116a5e7d70308f41fd27a1dd7b4675bb59827fe901c5a26a508d880a4')

build() {
    cd "$srcdir/pypcap-$pkgver"
    cython pcap.pyx
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pypcap-$pkgver"
    python -m installer \
        --destdir="$pkgdir" \
        --prefix=/usr \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et :
