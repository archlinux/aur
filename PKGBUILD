# Maintainer: Gustav Larson <gustav dot larson at gmail dot com>
pkgname=epeg-git
pkgver=r38.248ae9f
pkgrel=1
pkgdesc="An IMMENSELY FAST JPEG thumbnailer library API."
arch=('any')
url="https://github.com/mattes/epeg"
license=('MIT')
groups=()
depends=('libjpeg' 'libexif')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
noextract=()
_gitrepo="$url.git"

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	git clone --single $_gitrepo "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
