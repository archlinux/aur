# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>

_pkgname=pamac
pkgname=${_pkgname}-cli
pkgver=11.6.0
pkgrel=1
pkgdesc='Pamac cli frontend for libalpm'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/$pkgname"
license=('GPL3')
depends=('libpamac')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'asciidoc' 'git')
#source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
source=("git+$url.git#commit=a1cd2b9709a642b807f163fdbd6bd539b1881059")
sha256sums=('SKIP')

#_srcdir="$pkgname-$pkgver"
_srcdir="$pkgname"

prepare() {
	cd "$_srcdir"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
