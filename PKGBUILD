# Maintainer: Aayush Kumar <aayush214.kumar@gmail.com>
pkgname=torrcli
pkgver=0.3.1
pkgrel=1
pkgdesc="A cli based torrent client built with libtorrent"
arch=('x86_64')
url="https://github.com/aayushkdev/torrcli"
license=('MIT')
depends=('python' 'python-pip' 'libtorrent-rasterbar' 'python-rich' 'python-torrfetch' 'systemd')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
install="torrcli.install"
source=(
    "https://github.com/aayushkdev/torrcli/archive/refs/tags/v${pkgver}.tar.gz"
    "torrcli.service"
    "torrcli.install"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "$srcdir/torrcli.service" "$pkgdir/usr/lib/systemd/system/torrcli.service"

    install -Dm644 torrcli.conf.example "$pkgdir/usr/share/torrcli/torrcli.conf.example"
}
