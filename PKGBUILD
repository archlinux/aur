# Maintainer: yuhldr <yuhldr@gmail.com>

_pkgname=hplip
pkgname="$_pkgname"-lite
pkgver=3.22.10
pkgrel=1
pkgdesc="Only Print drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="https://hplipopensource.com"
license=('GPL2' 'custom')
depends=(libjpeg-turbo libcups)
makedepends=(python)
provides=('hplip')
backup=('etc/hp/hplip.conf')
conflicts=('hplip')
optdepends=('cups: for printing support')
source=(https://downloads.sourceforge.net/${_pkgname}/$_pkgname-$pkgver.tar.gz)
sha256sums=('533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624')

prepare() {
 cd "$_pkgname"-$pkgver
 rm -rf ./PPD_HP
}

build() {
 cd "$_pkgname"-$pkgver
 ./configure --prefix=/usr \
    --enable-lite-build \
    --disable-doc-build \
    --disable-fax-build \
    --disable-network-build \
    --disable-scan-build
make
}

package() {
 cd "$_pkgname"-$pkgver
 make DESTDIR="${pkgdir}/" install
    
  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 COPYING
}
