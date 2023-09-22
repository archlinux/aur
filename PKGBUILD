# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder-git
pkgver=1.13.0
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=('GPL')
groups=()
depends=('libadwaita')
optdepends=('mpv: Play the videos', 'youtube-dl: Play and download the videos')
makedepends=('git' 'rust' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://gitlab.com/schmiddi-on-mobile/pipeline.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        arch-meson $pkgname build
        meson compile -C build
}

package() {
        meson install -C build --destdir "$pkgdir"
}
