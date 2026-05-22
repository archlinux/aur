# Maintainer: Markus Meyer <coruja@gmx.de>

_pkgname=zoitechat
pkgname=$_pkgname-git
pkgver=r4799.479f1649
pkgrel=1
pkgdesc="GTK3 IRC client based on HexChat"
arch=('x86_64')
url="https://github.com/ZoiteChat/zoitechat"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libcanberra' 'python-cffi' 'libayatana-appindicator')
makedepends=('git' 'meson' 'glib2-devel' 'perl' 'lua')
optdepends=('pciutils: sysinfo plugin support' 'perl: perl script support' 'lua: lua script support')
provides=('zoitechat')
conflicts=('zoitechat')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$_pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
