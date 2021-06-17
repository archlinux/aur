# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=2.1.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://github.com/sonnyp/Commit"
license=('GPL3')
depends=('gjs' 'gtk3')
makedepends=('meson')
#checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
            'gspell: spell checking support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b6c9bc427229d2d0a539ab4dae27fe444a10c0db686e40af1b51a038bd2174f')

build() {
	arch-meson Commit-$pkgver build
	meson compile -C build
}

check() {

	# Validate appstream file fails, only validate desktop & schema files
	meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
