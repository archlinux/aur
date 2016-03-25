# Maintainer: Ian Brunelli (brunelli) <ianbrunelli@gmail.com>

pkgname=gnome-news-git
_gitname=gnome-news
pkgver=r240.775c743
pkgrel=1
pkgdesc='A GNOME 3 Feed Reader'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://git.gnome.org/browse/${_gitname}"
depends=('gtk3' 'python' 'tracker>=1.5.1')
makedepends=('appstream-glib' 'autoconf' 'automake' 'git' 'intltool')
options=('!emptydirs')
install=gnome-news.install
source=("git://git.gnome.org/${_gitname}")
md5sums=('SKIP')
conflicts=('gnome-news')
provides=("gnome-news=$pkgver")

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}
