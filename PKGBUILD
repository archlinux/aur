# Maintainer: Brad Kennedy <bk@co60.ca>
pkgname=stella-typer-git 
pkgver=v1.0.r0.c9d18c9
pkgrel=1
pkgdesc='Text expander for Linux'
arch=('i686' 'x86_64')
url='https://github.com/co60ca/stella'
license=('GPL3')
groups=()
depends=('libxtst' 'jsoncpp' 'protobuf' 'libuiohook')
makedepends=('cmake' 'git') 
provides=()
conflicts=('stella')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/co60ca/stella.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "stella"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "stella"
	./configure \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "stella"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
