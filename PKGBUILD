# Maintainer: Batou <batou at cryptolab dot net>
pkgname=mtn-git
pkgver=3.3.1.r0.g20b9e6e
pkgrel=1
pkgdesc="Movie Thumbnailer (mtn) saves thumbnails (screenshots) of movie or video files to image files (jpg, png)"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/movie_thumbnailer/mtn.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make DESTDIR="$pkgdir/" install
}
