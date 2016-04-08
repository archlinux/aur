# Contributor: Frederik Alkærsig (FALKER, FALK) <havnelisten@gmail.com>
# Contributor: Andy Kluger <andykluger@gmail.com>
pkgname=stream_unrar-git
pkgver=20140208.2a85bb8
pkgrel=1
pkgdesc='Start extracting multi-part rar archives as soon as the first part is available'
arch=('i686' 'x86_64')
license=('GPL2')
# depends=()
conflicts=('stream_unrar' 'libunrar')
provides=('stream_unrar' 'libunrar=4.0.7')
makedepends=('git' 'cmake')
source=('git+https://github.com/vlovich/stream-unrar.git')
md5sums=('SKIP')
url='https://github.com/vlovich/stream-unrar'

pkgver() {
	cd "${srcdir}/stream-unrar"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

# prepare() {}

build() {
	cd "${srcdir}/stream-unrar"
	cmake .
	make
}

package() {
	cd "${srcdir}/stream-unrar"
	install -D kde_service_menu/stream-unrar.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/stream-unrar.desktop
	install -D stream-unrar ${pkgdir}/usr/bin/stream-unrar
	install -D 3rd_party/unrar-4.0.7/libunrar.so ${pkgdir}/usr/lib/unrar.so
}
