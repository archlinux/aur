# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=x86info
_commit='081633bf8f64808340c01effa6f2077f921eb873'
pkgver=1.30.179
pkgrel=1
pkgdesc='A CPU identification utility. Provides more info than /proc/cpuinfo'
arch=('i686' 'x86_64')
depends=('pciutils')
url='https://github.com/kernelslacker/x86info'
license=('GPL')
makedepends=('git' 'python')
source=("git+https://github.com/kernelslacker/x86info.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}/"

	# Version 1.30 is latest release, but it does not have a tag.
	# So count from commit...
	echo "1.30.$(git rev-list --count b69b850c50..)"
}

build() {
	cd "${srcdir}/${pkgname}/"

	make

	cd lsmsr/

	make
}

package() {
	cd "${srcdir}/${pkgname}/"

	install -D -m0775 x86info "${pkgdir}/usr/bin/x86info"
	install -D -m0775 lsmsr/lsmsr "${pkgdir}/usr/bin/lsmsr"
	install -D -m0644 x86info.1 "${pkgdir}/usr/share/man/man1/x86info.1"
	install -D -m0644 lsmsr/lsmsr.8 "${pkgdir}/usr/share/man/man8/lsmsr.8"
}

