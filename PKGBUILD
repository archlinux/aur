pkgname=simple-thumbnailer-stl
pkgver=4.348b27a
pkgrel=1
pkgdesc='Create isometric thumbnails from STL models using software rendering'
url=''
license=('GPL')
source=(git+https://gitlab.com/zoli111/simple-thumbnailer-stl.git)
makedepends=('cargo')
arch=('i386' 'x86_64')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 target/release/simple-thumbnailer-stl "${pkgdir}/usr/bin/simple-thumbnailer-stl"
	install -Dm644 simple-thumbnailer-stl.thumbnailer "${pkgdir}/usr/share/thumbnailers/simple-thumbnailer-stl.thumbnailer"
}
