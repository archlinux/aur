# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=opkg-git
pkgver=v0.4.0
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=(x86_64)
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme')
source=("${url}/snapshot/${pkgname%-git}-${pkgver}.tar.gz")
sha256sums=('2582aff962d4b65db750b8acdacd99127ed22112f38b65f38fde2cef1039c776')

prepare() {
	cd ${pkgname%-git}-${pkgver}
	./autogen.sh
	./configure --prefix=/usr
}

build() {
	cd ${pkgname%-git}-${pkgver}
	make
}

package() {
	cd ${pkgname%-git}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}
