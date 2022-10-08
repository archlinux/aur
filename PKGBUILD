# Maintainer: k1f0 <generic@k1f0.mozmail.com>
_pkgname=signalbackup-tools
pkgname=${_pkgname}-git
pkgver=20220914.1.r1.g3792949
pkgrel=2
pkgdesc="Tool to work with Signal Backup files"
arch=('x86_64')
url="https://github.com/bepaald/signalbackup-tools"
license=('GPL3')
depends=('openssl' 'sqlite')
makedepends=('git')
provides=("signalbackup-tools")
conflicts=()
source=("git+https://github.com/bepaald/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	/bin/bash ./BUILDSCRIPT_MULTIPROC.bash44
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
