# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: AnActualEmerald <emerald at mecha dot garden>

pkgname=papa
pkgver=3.0.1
pkgrel=1
pkgdesc="Mod manager CLI for Northstar"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
makedepends=('cargo' 'openssl' 'git')
optdepends=('sccache: compiler caching for faster compiling')
_commit=ef1cc1ad3dc6d731d8eaafd6d81b2679e74e06bb
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/AnActualEmerald/thermite.git#commit=$_commit")
sha256sums=('7ac33e20f6dadc684c94bb834b4a51872ba5af4c0decd72c641052b3039a9682'
            'SKIP')

prepare() {
  mkdir -p $pkgname-$pkgver/thermite
  cp -r thermite $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
}
