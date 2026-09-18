# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
#
# Template — not a buildable PKGBUILD. On release the publish_aur workflow
# substitutes 0.1.0, fills sha256sums via updpkgsums, generates .SRCINFO,
# and pushes the rendered files to the AUR; nothing is committed back here.
pkgname=jev-preview
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal sandbox for the TypeSafe (Jev) System One API"
arch=(any)
url="https://github.com/ArkadyBuryakov/jev-preview"
license=(MIT)
# Every runtime dependency is in the official repositories: textual pulls
# rich and pygments along itself. The [syntax] extra is deliberately not a
# dependency — nothing here builds a tree-sitter TextArea.
depends=(python python-textual python-httpx python-platformdirs)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3a7c639b52ffe90faeab48c438b3ea04921bea74938094027cfab8a977f8f9fc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
