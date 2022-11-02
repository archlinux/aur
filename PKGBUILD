# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Contributor: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.1.0
pkgrel=2
pkgdesc='A lightweight text editor written in Lua'
arch=(x86_64 aarch64)
url="https://$pkgname.com"
license=(MIT)
makedepends=(meson)
depends=(freetype2
         lua
         pcre2
         sdl2)
conflicts=(lite)
provides=(lite)
_archive="$pkgname-$pkgver"
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('761d390d0ef2706eeed1c685211d8ff5ce63dacd51d561e56c7e0f7ec0e7ea62')

build() {
        arch-meson "$_archive" build
        meson compile -C build
}

package() {
        meson install --skip-subprojects -C build --destdir "$pkgdir"
        cd "$_archive"
        install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
