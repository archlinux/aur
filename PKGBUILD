# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=vdr-sxfe-git
pkgrel=1
pkgver=r2821.c9e9835
pkgdesc="VDR xineliboutput sxfe frontend. This package does not contain the vdr plugin."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/xineliboutput"
license=('GPLv2')
depends=('libcec' 'dbus-glib' 'libxrandr' 'mesa' 'xine-lib')
makedepends=('git' 'autoconf' 'automake')
conflicts=('xineliboutput-frontends')
source=("${pkgname}"::'git://git.code.sf.net/p/xineliboutput/git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	export CFLAGS+=' -fPIC'
	./configure --disable-fb --disable-vdr --enable-x11 --enable-libxine
	make
} 

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir" install
}
