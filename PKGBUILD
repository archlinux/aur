# Maintainer:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: DriverX
# Contributor: Nicolas Quiénot <niQo @ aur>
# Contributor: Martin Schrodt <martin@schrodt.org>
pkgname=nvme-cli
pkgver=1.8.1
pkgrel=1
pkgdesc="NVM-Express user space tooling for Linux"
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('systemd')
makedepends=('git')
conflicts=('nvme-cli-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linux-nvme/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('93b9134b7a4cc36c9444b9ee52ef016be6e3e2f2ece50fab1f4a56ebe1e3612b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS="${CFLAGS} -I." make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr SBINDIR=/usr/bin install
}
