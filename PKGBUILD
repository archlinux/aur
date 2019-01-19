# Maintainer: Omar Pakker <omar.pakker@oracle.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=dmidecode-git
pkgver=r594.74dfb85
pkgrel=1
pkgdesc="Desktop Management Interface table related utilities"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/dmidecode"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('dmidecode')
conflicts=('dmidecode')
source=("git://git.savannah.nongnu.org/dmidecode.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/dmidecode"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/dmidecode"

	sed -i "s:sbin:bin:g" Makefile
	make prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
	cd "${srcdir}/dmidecode"

	make prefix=/usr DESTDIR="${pkgdir}" install
}
