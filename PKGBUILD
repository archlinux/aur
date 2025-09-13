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
sha256sums=('d3ea39fd2d26320e00910c94c80d4220549ef9157810c1dba6949e04ec0a5fd4'
            '5f79a8abcb505673e8f9527daf5196ecaa17282404ff8587efb7f4508c50661e'
            'e8be9c3c96a21d8586dfb30ab6218fd0d57299efee59edb9c889aaf89018ef1d')
