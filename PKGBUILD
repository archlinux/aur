# Contributor: Étienne Deparis <etienne@depar.is> (stable goodvibes AUR pkg)

pkgname=goodvibes-git
pkgver=0.8.1.r3.g8486def
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=(
	"gst-plugins-base"
	"gst-plugins-good"
	"gst-plugins-ugly"
	"libkeybinder3"
	"libsoup"
)
makedepends=(git meson glib2-devel)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
conflicts=(goodvibes)
provides=(goodvibes)

pkgver() {
    cd goodvibes-git
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}


build() {
    cd goodvibes-git
    meson --prefix=/usr build
    cd build
    ninja
}

package() {
    cd goodvibes-git/build
    DESTDIR="$pkgdir" ninja install
}
