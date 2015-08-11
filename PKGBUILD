# Maintainer: Joss Wright (joss-arch@pseudonymity.net)
# Please contact me at the above or comment at the AUR
# if you have any issues.

pkgname=centerim5-git
pkgver=git
pkgrel=1
pkgdesc="CenterIM5 - An ncurses based terminal chat client - git development version" 
arch=('i686' 'x86_64')
url="http://centerim.org/"
license=('GPL')
depends=('python2' 'libjpeg' 'gpgme' 'libpurple' 'ncurses' 'libsigc++')
makedepends=('ca-certificates')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!libtool')
source=('git+ssh://mob@repo.or.cz/srv/git/centerim5.git#branch=mob')
sha256sums=('SKIP')

pkgver() {

	# Get the tag of the latest commit
	cd ${pkgname%-*} 
	git describe --always | sed 's/-/./g'

}

build() {
	
	cd ${pkgname%-*}
	msg "Starting make..."

	./bootstrap
	./configure --prefix=/usr

	make

}

package() {

	cd ${pkgname%-*}
	make DESTDIR="$pkgdir" install

}
