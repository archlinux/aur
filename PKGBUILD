# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Contributor: Thor K. Høgås <thor at roht.no>

pkgname=matterhorn
pkgver=90000.0.0
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
sha256sums=('24a0eb9328e9afeea46af389d898d0ba9cc5a06fb5d9e9ee9394c342f1b695db')

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
