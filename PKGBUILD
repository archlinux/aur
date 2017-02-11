# Maintainer: Martin Schrodt <martin@schrodt.org>
pkgname=nvme-cli-git 
_gitname=nvme-cli
pkgver=r492.bfdeef8
pkgrel=1
pkgdesc="NVM-Express user space tooling for Linux"
arch=('i686' 'x86_64')
url="https://github.com/linux-nvme/nvme-cli"
license=('GPL')
depends=('systemd')
makedepends=('git')
provides=('nvme-cli')
conflicts=('nvme-cli')
source=('git://github.com/linux-nvme/nvme-cli.git')
md5sums=('SKIP')

pkgver() { 
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}
