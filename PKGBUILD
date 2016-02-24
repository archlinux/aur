# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=opkg-git
pkgver=v0.3.1
pkgrel=1
pkgdesc="Opkg is a lightweight package management system based upon ipkg"
arch=(x86_64)
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg"
license=('GPL')
depends=('curl' 'libarchive' 'gpgme')
source=("${url}/snapshot/${pkgname%-git}-${pkgver}.tar.gz")
sha256sums=('994182896ce8fdaa60f8af07a0c7e29ef770f20a69742fb606cb3b450e02aeaf')

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
