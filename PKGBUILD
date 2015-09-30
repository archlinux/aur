# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=x86info
_commit=27ace37d
pkgver=1.30.137
pkgrel=2
pkgdesc='A CPU identification utility. Provides more info than /proc/cpuinfo'
arch=('i686' 'x86_64')
url="http://www.codemonkey.org.uk/projects/x86info/"
license=('GPL')
install=x86info.install
makedepends=('git')
source=("git://github.com/dankamongmen/x86info.git#commit=${_commit}")
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

