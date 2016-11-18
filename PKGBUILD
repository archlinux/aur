# Maintainer: Tbsc <me@tbscdev.xyz>

pkgname=ratslap-git
pkgver=0.2.0.r2.g353fe44
pkgrel=1
pkgdesc="Community made Linux drivers for Logitech mice (Currently only G300s)"
arch=('i686' 'x86_64')
url="https://gitlab.com/krayon/ratslap"
license=('GPL2')
depends=('libusb')
makedepends=('git' 'ctags')
provides=('ratslap')
conflicts=('ratslap')
options=()
install=
source=('ratslap-git::git+https://gitlab.com/krayon/ratslap')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ratslap-git"
	
	( set -o pipefail
    	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  	)

	# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

	# Git, no tags available
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/ratslap-git"
	make
}

check() {
	true
}

package() {
	cd "$srcdir/ratslap-git"
	install -Dm755 "$srcdir/ratslap-git/ratslap" "${pkgdir}/usr/bin/ratslap"
}
