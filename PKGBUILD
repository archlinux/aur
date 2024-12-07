# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
# TODO: Dependency on openslide and poppler-glib is unclear,
#       technically these are optional dependencies of libvips
#       and faircamp does not require them either (no TIFF or SVG/PDF
#       related operations with libvips), but at least two people have
#       reported runtime errors related to libvips without them (for faircamp-git).
depends=('ffmpeg' 'libvips>=8.13.3' 'openslide' 'opus' 'poppler-glib')
license=('AGPL3')
makedepends=('cmake' 'git' 'rust')
options=('!lto')
pkgdesc='A static site generator for audio producers'
pkgname=faircamp
pkgrel=1
pkgver=0.23.0
sha256sums=('64e772e4af7ca1fd0c2a24594d19cedd1577c5827ade7b5dd5993d84a80a6940')
url='https://simonrepp.com/faircamp'

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/faircamp/archive/${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname"
	cargo build --features libvips --locked --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
}
