# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=turbomem-git
pkgver=r135.b618013
pkgrel=1
pkgdesc="Linux driver for Intel Turbo Memory Controller (Robson) PCIe card"
arch=('i686' 'x86_64')
url='https://github.com/yarrick/turbomem'
license=('GPL')
depends=()
optdepends=('mtd-utils: format MTD device')
makedepends=()
provides=('turbomem')
install=turbomem.install
source=("turbomem-git::git+https://github.com/yarrick/turbomem.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	# Use the number of revisions
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${pkgname}"
	make
}

package()
{
	cd "${srcdir}/${pkgname}"
#	make DESTDIR=${pkgdir} install
	make INSTALL_MOD_PATH=${pkgdir}/usr install
}
