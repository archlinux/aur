# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=zeal
epoch=1
pkgver=0.1.1
pkgrel=2
pkgdesc='Simple offline API documentation browser'
arch=(x86_64 i686)
url='http://zealdocs.org/'
license=('GPL')
depends=('qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils' 'libarchive')
makedepends=()
conflicts=(zeal-git)
install=zeal.install
source=(zeal-${pkgver}.tar.gz::https://github.com/jkozera/zeal/archive/v${pkgver}.tar.gz
  add_qdatastream_include.patch
  zeal.install)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "${srcdir}/add_qdatastream_include.patch"
	qmake CONFIG+=no_libappindicator
	make ZEAL_VERSION=${pkgver}
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}

sha256sums=('f4e959f9bc66a6e350ee8a33d34695379633432d103db9776c0c7a76cbc5a9d6'
            '8aa8b29ea5d0ff06766eac6c8ad659012bfa71b0b62167bb0b2382291be7ad6b'
            '00c8482dd54eaa217682adee62267e8b9e45cc72842cba82ae7de370301cd4eb')
