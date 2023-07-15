# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Contributor: Thor K. Høgås <thor at roht.no>

pkgname=matterhorn
pkgver=50200.19.0
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
sha256sums=('66acd04967f0e527483cc360f12926abc23965b3869cf034cf8b333e02e07be1')

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
