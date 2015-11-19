# Maintainer: Your Name <youremail@domain.com>
pkgname=libpam-blue
pkgver=0.9.0
pkgrel=1
pkgdesc="PAM module for local authenticaction with bluetooth devices."
arch=('any')
url="https://launchpad.net/ubuntu/+source/libpam-blue"
license=('GPL')
depends=('bluez' 'bluez-libs' 'glibc')
makedepends=('automake' 'autoconf' 'libtool' 'bluez-libs')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/libp/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	"libpam-blue.patch")
md5sums=("b95c27f1c13bf4e07be9dd57b2f4db71"
	 "97a12dbda2e690fb7b7cacdeb8297b3b")

prepare() {
 cd "${srcdir}"/${pkgname}-${pkgver}.orig
 patch -Np1 -i ../libpam-blue.patch
}

build() {
  cd "${pkgname}-${pkgver}.orig"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}.orig"

  make DESTDIR="$pkgdir" install
}
