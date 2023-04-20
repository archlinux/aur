# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
# Contributor: Thor K. Høgås <thor at roht.no>

pkgname=matterhorn
pkgver=50200.18.0
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
sha256sums=('0ee66eaf3d0841f125664306b4b144d69f7cb182fcd64f4ef8538fdf964118d4')

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
