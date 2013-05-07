# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=libnotify-id-git
pkgver=0.7.5.1.g6982957
pkgrel=1
pkgdesc="Gnome notification library, including ID patch"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://library.gnome.org/devel/libnotify/"
makedepends=('pkgconfig' 'git' 'gobject-introspection' 'gtk-doc' 'gnome-common')
options=('!libtool')
conflicts=('libnotify' 'libnotify-git')
provides=('libnotify=0.7.5')
source=('libnotify-id-git::git://git.gnome.org/libnotify.git'
		'https://launchpadlibrarian.net/105791133/print-and-replace-id-v3.patch')
md5sums=('SKIP'
		'f75d23de7ee23e37ac36889ece359587')

pkgver(){
	cd "${srcdir}/${pkgname}"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -p1 < ../../print-and-replace-id-v3.patch
}

build(){
	cd "${srcdir}/${pkgname}"
	./autogen.sh --prefix=/usr
	make
}

package(){
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
