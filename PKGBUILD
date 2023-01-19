# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gcedit
pkgver=0.4.3
pkgrel=1
pkgdesc="GameCube disk image editor"
arch=(any)
url=http://ikn.org.uk/app/gcedit
license=(GPL3)
makedepends=(python-setuptools)
depends=("python>=3.2" "python-gobject>=3.11")
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('44762ef524db10fac0a00f4e75c16dc34f7113a6c0a9ebe7d8ca38bee51fa314')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    local python_path="$(./get_python_lib "$pkgdir/usr")"
    PYTHONPATH="$PYTHONPATH:$python_path" \
        make DESTDIR="$pkgdir" prefix=/usr install
}
