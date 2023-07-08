# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=papa
pkgver=3.1.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
makedepends=('cargo' 'git')
optdepends=('sccache: compiler caching for faster compiling')
_commit=21f48f82509e568a4a54f64a7612a45c2016a733
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
