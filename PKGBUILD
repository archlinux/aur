# Maintainer: yuhldr <yuhldr@gmail.com>

pkgname_=hplip
pkgname="$pkgname_"-lite
pkgver=3.22.6
pkgrel=0
pkgdesc="Only Print drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="https://hplipopensource.com"
license=('GPL2' 'custom')
depends=()
conflicts=('hplip')
optdepends=('cups: for printing support')
source=(https://downloads.sourceforge.net/${pkgname_}/$pkgname_-$pkgver.tar.gz)
sha256sums=('27ed0d492febb0b47c656234820d3ce573b24ff5b62e3bf4b2c47f82868d6bb4')

prepare() {
 cd "$pkgname_"-$pkgver
 rm -rf ./PPD_HP
}

build() {
 cd "$pkgname_"-$pkgver
 ./configure --prefix=/usr \
    --enable-lite-build \
    --disable-doc-build \
    --disable-fax-build \
    --disable-network-build \
    --disable-scan-build
make
}

package() {
 cd "$pkgname_"-$pkgver
 make DESTDIR="${pkgdir}/" install
}
