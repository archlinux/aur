# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Contributor: Thor K. Høgås <thor at roht.no>

pkgname=matterhorn
pkgver=50200.17.0
pkgrel=1
pkgdesc='A terminal-based chat client for MatterMost'
arch=(x86_64)
url="https://github.com/matterhorn-chat/$pkgname"
license=(BSD)
depends=(gmp
         zlib)
makedepends=(cabal-install
             ghc)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('91c2bca1bc428eb78f1ba511c87e01a886cc98fc7e5ff5668b96ff4a295ff8da')

prepare() {
	cd "$_archive"
	rm -f cabal.project
}
build() {
	cd "$_archive"
	cabal new-update
	cabal new-build -j --enable-shared --enable-executable-dynamic --ghc-options=-dynamic
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" $(find . -name "matterhorn" -type f)
	install -Dm0644 -t "$pkgdir/usr/share/licenses/matterhorn/" LICENSE
}
