# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# based-from: Christoph Drexler <chrdr at gmx dot at>

pkgname=grisbi-git
pkgver=1.0.0.216.gfaf4df2
pkgrel=1
pkgdesc="Personal financial management program"
arch=('i686' 'x86_64')
url="http://www.grisbi.org"
license=('GPL')
depends=('desktop-file-utils' 'goffice')
makedepends=('gettext' 'grep' 'intltool')
optdepends=('libofx: for OFX support')
options=(!libtool)
install=grisbi.install
source=("git://git.code.sf.net/p/grisbi/code")
sha256sums=('SKIP')

pkgver() {
	cd code
	desc="$(git describe)"
	desc=${desc//upstream_version_/}
	desc=${desc//_/.}
	desc=${desc//-/.}
	printf "${desc}"
}

build() {
	cd code
	./autogen.sh
	./configure \
		--disable-frenchdoc \
		--prefix=/usr
	make
}

package() {
	cd code
	make DESTDIR="${pkgdir}" install
}
