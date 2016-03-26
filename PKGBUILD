#Contributor: Rasi <rasi at xssn dot at>
#Maintainer: Rasi <rasi at xssn dot at>

pkgname=stuffkeeper-git
provides=('stuffkeeper')
arch=('i686' 'x86_64')
pkgver=650.c3c61ea
pkgrel=1
pkgdesc="A little gtk tool for managing all your stuff"
url="http://www.stuffkeeper.org"
license=('GPL')
depends=('sqlite3' 'python' 'gtk2' 'libglade' 'gpgme' 'xdg-utils' 'libunique')
makedepends=('gcc' 'glibc' 'git' 'intltool' 'gob2' 'pkgconfig' 'vala>=0.7')
md5sums=()
options=('!libtool')
source=('git+https://github.com/DaveDavenport/stuffkeeper.git')

pkgver() {
	cd stuffkeeper
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/stuffkeeper"
	./autogen.sh --prefix=/usr
	make
}

package () {
    cd "${srcdir}/stuffkeeper"
	make DESTDIR="${pkgdir}" install
	find ${pkgdir} -type f -name "*.la" -exec rm {} \;
}

md5sums=('SKIP')
