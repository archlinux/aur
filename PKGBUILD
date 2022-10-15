# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Contributor: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.1.0
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=(x86_64 aarch64)
url="https://$pkgname.com"
license=(MIT)
makedepends=(meson)
depends=(agg
         freetype2
         lua
         pcre2
         reproc
         sdl2)
conflicts=(lite)
provides=(lite)
_archive="$pkgname-$pkgver"
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0696c3337038276c56afa5d90dec6b6b85c4781022b40165c82e1bdd65db490e')

build() {
	arch-meson "$_archive" build
	meson compile -C build
}

package() {
	meson install --skip-subprojects -C build --destdir "$pkgdir"
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
