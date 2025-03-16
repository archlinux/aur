# Maintainer: Amirhossein Ghanipour d3v1ll3n@gmail.com
pkgname=archlink
pkgver=0.1.1
pkgrel=1
pkgdesc="ArchLink helps Arch Linux users to find the right packages to install"
arch=('x86_64')
url="https://github.com/amirhosseinghanipour/archlink"
license=('MIT')
depends=('pacman' 'sudo')
optdepends=('yay: for installing AUR packages'
            'paru: for installing AUR packages')
makedepends=('cargo' 'git')  
source=("git+$url.git#tag=v$pkgver")
sha256sums=('48f43fa6425c4cc450a74ad2db4463da2c9c37a120515889ce0fc40fecbdf3c7')  

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 <(echo -e "[default]\nmax_results = 10") "$pkgdir/etc/archlink/config.toml"
}
