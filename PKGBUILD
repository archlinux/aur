# Maintainer: jgmdev <jgmdev at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Térence Clastres <t dot clastres at gmail dot com>
# Contributor: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.1.2
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=(x86_64 aarch64)
url="https://$pkgname.com"
license=(MIT)
depends=(freetype2
         lua
         pcre2
         sdl2)
makedepends=(git # used by Meson to fetch submodule, TODO: move to source()
             meson)
conflicts=(lite)
provides=(lite)
_archive="$pkgname-$pkgver"
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0ad5acbdc7a08f771386283f40f967c87a1d002bc5232ca78af2aa4fdb7bf38b')

build() {
        arch-meson "$_archive" build -D use_system_lua=true
        meson compile -C build
}

package() {
        meson install --skip-subprojects -C build --destdir "$pkgdir"
        cd "$_archive"
        install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
