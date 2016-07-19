# Maintainer: Sebastian Schrader <sebastian.schrader@ossmail.de>
pkgname=pyconfigure
pkgver=0.2.3
pkgrel=2
pkgdesc="Build autotools/autoconf configure scripts for Python packages"
arch=('any')
url='https://www.gnu.org/software/pyconfigure/'
license=(custom)
depends=('autoconf' 'python')
makedepends=()
source=("https://ftp.gnu.org/gnu/pyconfigure/$pkgname-$pkgver.tar.gz")
sha256sums=('37438ee1ae0aad7692188c7d01218cb407a1c89f3efdb5d360311b7ade4ab14f')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    cd "$pkgdir"
    install -d "usr/share/licenses/$pkgname"
    mv "usr/share/doc/$pkgname/COPYING" "usr/share/licenses/$pkgname/LICENSE"
    mv "usr/share/doc/$pkgname/COPYING.GPLv3" "usr/share/licenses/$pkgname"
    mv "usr/share/doc/$pkgname/COPYING.EXCEPTION" "usr/share/licenses/$pkgname"
}
