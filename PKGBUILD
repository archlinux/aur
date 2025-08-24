# Maintainer: Joss Wright (joss-arch@pseudonymity.net)
# Please contact me at the above or comment at the AUR
# if you have any issues.

pkgname=centerim5-git
pkgver=r1221.b03a616
pkgrel=1
pkgdesc="CenterIM5 - An ncurses based terminal chat client - git development version" 
arch=('i686' 'x86_64')
url="https://repo.or.cz/centerim5.git"
license=('GPL')
depends=('python' 'libjpeg' 'libtermkey' 'gpgme' 'libpurple' 'ncurses' 'libsigc++')
makedepends=('ca-certificates' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!libtool')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "centerim5-git"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	
	cd ${pkgname-git}
	msg "Starting make..."

	./bootstrap
	./configure --prefix=/usr

	make

}

package() {

	cd ${pkgname-git}
	make DESTDIR="$pkgdir" install

}
