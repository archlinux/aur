#Maintainer: Lace Taylor <lace@laceflower.me>
pkgname=yaabe-git
pkgver=v0.5.0.r531.b568c55
pkgrel=1
pkgdesc="Yet Another Atom BIOS Editor - Parse and edit AMD/ATI vBIOS"
arch=('x86_64')
url="https://github.com/netblock/yaabe"
license=('AGPL-3.0-only')
depends=('zlib' 'glib2' 'gtk4' 'python-json5')
makedepends=('meson' 'ninja' 'git')
conflicts=('yaabe')
provides=('yaabe')
source=("yaabe-git::git+https://github.com/netblock/yaabe.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "v%s.r%s.%s" "$(grep -o -e [[:digit:]].[[:digit:]].[[:digit:]] meson.build | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	meson setup build --prefix /usr --buildtype=release -Db_lto=true
	meson compile -C build
}

package() {
	cd "$pkgname"
	meson install -C build --destdir "$pkgdir"
}
