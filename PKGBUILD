# Maintainer: Archisman Panigrahi <apandada1AtgmailDotcom>

pkgname='hieroglyphic'
pkgver='1.1.0'
pkgrel='1'
pkgdesc="Find LaTeX symbols."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/FineFindus/Hieroglyphic'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('meson' 'rust' 'git')
source=("hieroglyphic::git+https://github.com/FineFindus/Hieroglyphic#tag=v$pkgver")
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('bbe440acb464dfa6097e0718a203ed5655d96d3d845588e49c0d04aff9084ca4')

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
