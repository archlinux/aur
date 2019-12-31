# Maintainer: Justin Dray <justin@dray.be>

_pkgname=libnotify
pkgname=${_pkgname}-id
pkgver=0.7.8
pkgrel=1
pkgdesc="Desktop notification library"
arch=('i686' 'x86_64')
url="http://library.gnome.org/devel/notification-spec/"
license=('LGPL')
depends=('gdk-pixbuf2')
makedepends=('gtk3' 'gobject-introspection')
conflicts=('libnotify' 'libnotify-git' 'libnotify-id-git')
provides=("libnotify=$pkgver")
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.7/${_pkgname}-${pkgver}.tar.xz"
        'https://launchpadlibrarian.net/105791133/print-and-replace-id-v3.patch')
sha256sums=('69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c'
            '88655522acb5a4c1634de368e91ae79b4a8f205288bf4451e82e007266ba4fcb')

prepare() {
	cd ${_pkgname}-${pkgver}
	patch -Np1 -i '../print-and-replace-id-v3.patch'
}

build() {
	cd ${_pkgname}-${pkgver}
	./autogen.sh --prefix=/usr --disable-static
	make
}

package() {
	cd ${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
