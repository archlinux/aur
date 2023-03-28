# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>
# Contributor: AnActualEmerald <emerald@mecha.garden>

pkgname=papa
pkgver=3.0.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
makedepends=('cargo' 'openssl' 'pkgconf' 'git')
optdepends=('sccache: compiler caching for faster compiling')
_commit=ef1cc1ad3dc6d731d8eaafd6d81b2679e74e06bb
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/AnActualEmerald/thermite.git#commit=$_commit")
sha256sums=('02a2cd0af1a601a845e9be97759892ea47148944d657b22b4834f44608b25b72'
            'SKIP')

prepare() {
  mkdir -p $pkgname-$pkgver/thermite
  cp -R thermite $pkgname-$pkgver
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
