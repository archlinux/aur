# Maintainer: Dan Milne <d@nmilne.com>

pkgname=silo-bin
_pkgname=silo
pkgver=0.4.2
pkgrel=1
pkgdesc="Self-hosted Dropbox in one binary - SeaDrive-compatible, SQLite-backed, TUI-managed (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/dkam/silo"
license=('AGPL-3.0-only')
# NOTE: no provides/conflicts on 'silo' - that AUR name belongs to LLNL's
# unrelated scientific data format library, and claiming it would make the two
# falsely exclusive. Nothing here collides with its file list.
options=('!strip' '!debug')

source=("$_pkgname-$pkgver-LICENSE.txt::$url/raw/v$pkgver/LICENSE.txt"
        "$_pkgname.service")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.tar.gz")

sha256sums=('e987aa2f85f1d50f8a2a545e9646e577338966ae45e0386aaf913b0dec655f6a'
            '4a98ad92a32910eee400d060dd585888e02f5fd0249ee37b3d6c76de756fd550')
sha256sums_x86_64=('f27b6743c2f620e951cee3d202af975fd848bcf6af140916bd3b812da19e8f13')
sha256sums_aarch64=('1c8f8ff418abfc275eddf2e39c4280015f400d337dbf945e32e2309c812eb772')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
