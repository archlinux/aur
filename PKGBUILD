# Maintainer: Dan Milne <d@nmilne.com>

pkgname=silo-bin
_pkgname=silo
pkgver=0.4.1
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
sha256sums_x86_64=('4d2b3a5d6180c36e44cd4561dff35f8bafe5de3f8b78377d95ad3a295ca3a5a0')
sha256sums_aarch64=('eef9a0053046a2f13698ed3ec13a4118a2a021f4edbaca66bd24c4cb75c03d12')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
