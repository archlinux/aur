# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.5.1
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('KSMBD-MODULE' 'libnl')
provides=('samba')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("4728470abebd15b05dcf1327630459aedc9beca273672788a07e7424ba7b25dc")

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-rundir=/run
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
