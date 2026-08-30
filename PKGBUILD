# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=servo-fetch
pkgname="${_pkgname}-bin"
pkgver=0.14.2
pkgrel=1
pkgdesc="Self-contained browser engine that fetches, renders, and extracts web content as Markdown, JSON, or screenshots"
arch=('x86_64' 'aarch64')
url="https://github.com/konippi/servo-fetch"
license=('MIT' 'Apache-2.0')
depends=('mesa' 'fontconfig' 'freetype2' 'zlib' 'libstdc++' 'libgcc')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('31d26c77db8c48edff6593e553e18c45d3834c77f7cfcb21ce8bccac1544886b')
sha256sums_aarch64=('54a2883708dcad2e80abe989c384cdbacccc4873a2e2fdfce176713d36cb2248')
options=('!debug')

package() {
	cd "$srcdir"
	local _target
	case "$CARCH" in
		x86_64) _target="x86_64-unknown-linux-gnu" ;;
		aarch64) _target="aarch64-unknown-linux-gnu" ;;
	esac
	local _dir="${_pkgname}-v${pkgver}-${_target}"

	install -Dm755 "$_dir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "$_dir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_dir/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
