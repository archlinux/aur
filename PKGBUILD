# Maintainer: Ian Brunelli (brunelli) <ian@brunelli.me>

pkgname=gnome-news-git
_gitname=gnome-news
pkgver=r86.dec2231
pkgrel=1
pkgdesc='Music player for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/ignatenkobrain/${_gitname}"
depends=('gtk3' 'libgrss' 'python' 'tracker')
makedepends=('git' 'gnome-common' 'intltool' 'itstool')
options=('!emptydirs')
install=gnome-news.install
source=("git://github.com/ignatenkobrain/${_gitname}.git")
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
