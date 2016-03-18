pkgname=leleleplayer-git
_gitname=leleleplayer
pkgver=v0.7.r1.g9d79a1e
pkgrel=1
pkgdesc="An audio player wich can find similar songs in your library"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'ffmpeg' 'gtk3' 'bliss-git')
optdepends=('gst-plugins-ugly: Needed for some audio format support')
install="$_gitname.install"
source=("$pkgname::git://github.com/Polochon-street/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	mkdir -p build
}

build() {
        cd "$srcdir/$pkgname/build"
        cmake .. -DCMAKE_BUILD_TYPE=Release
        make
}
 
package() {
        cd "$srcdir/$pkgname/build"
        make DESTDIR="$pkgdir" install 
} 
