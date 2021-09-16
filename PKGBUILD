# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
source=("$pkgname-$pkgver.deb::https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-bullseye_amd64.deb")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('4ac6c112b7b9a60207df4be9b17d68c0fa053b23871c410a8187c397673387b2')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  /usr/bin/bsdtar -xf "$pkgname-$pkgver.deb" -C "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p "data"
  /usr/bin/bsdtar -xf "data.tar.xz" -C "data"
}

package() {
  cd "$pkgname-$pkgver/data"
  install -Dm755 ./usr/bin/interactive-rebase-tool -t "$pkgdir/usr/bin"
  install -Dm644 ./usr/share/man/man1/interactive-rebase-tool.1.gz -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 ./usr/share/doc/interactive-rebase-tool/README.md -t "$pkgdir/usr/share/doc/interactive-rebase-tool/"
  install -Dm644 ./usr/share/doc/interactive-rebase-tool/CHANGELOG.md -t "$pkgdir/usr/share/doc/interactive-rebase-tool/"
  install -Dm644 ./usr/share/doc/interactive-rebase-tool/readme/customization.md -t "$pkgdir/usr/share/doc/interactive-rebase-tool/readme"
}
