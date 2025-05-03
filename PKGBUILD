#$ 
### Based on extra/iotop-c
# Maintainer: 		EndlessEden <endlesseden@users.noreply.github.com>
##
# Archlinux Maintainer: Chistian Heusel <gromit@archlinux.org>
# Archlinux Maintainer: Robin Candau <antiz@archlinux.org>
# Archlinux Contributor: Rumen Jekov <rvjekov@gmail.com>
# Archlinux Contributor: Boian Bonev <bbonev@ipacct.com>

pkgname=iotop-c-git
_pkgname=iotop
pkgver=1.28_r683.g9065504
pkgrel=1
pkgdesc="A top utility for IO"
url="https://github.com/Tomas-M/iotop"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('git')
conflicts=('iotop')
provides=('iotop')
source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
cd "$_pkgname"
_ver="$(git describe --long --tags | sed 's|v|\n|g' | sed 's|-|\n|g' | head -2 | tail -1)"
echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make STRIP=: DESTDIR="${pkgdir}" BINDIR="${pkgdir}/usr/bin" install
}
