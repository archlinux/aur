# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=papa
pkgver=4.0.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
makedepends=('cargo' 'git')
optdepends=('sccache: compiler caching for faster compiling')
_commit=fa5617c1a1894d0ffd7aff69ccacfc61f8a600a2
source=("git+$url.git#tag=v$pkgver"
        "git+https://github.com/AnActualEmerald/thermite.git#commit=$_commit")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  mkdir -p $pkgname/thermite
  cp -r thermite $pkgname
}

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
}
