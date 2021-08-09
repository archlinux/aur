# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=share-preview-git
_pkgname=share-preview
pkgver=0.1.2
pkgrel=1
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust' 'git')
checkdepends=('appstream-glib')
source=(git+$url.git)
md5sums=('SKIP') #autofill using updpkgsums

build() {
	arch-meson "$_pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
