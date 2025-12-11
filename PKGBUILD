pkgname=aicommits-rs 
pkgver=0.1.1          
_commitmsg_exec=aic  
pkgrel=1
pkgdesc="A Rust-based CLI tool that generates semantic Conventional Commits messages using Google Gemini AI."
arch=('x86_64')
url="https://github.com/RuanVasco/aicommits-rs"
license=('GPL-3.0-only')
provides=("aic") 
depends=('curl' 'git') 
makedepends=('cargo' 'rust' 'git') 
source=("$pkgname-$pkgver.tar.gz::https://github.com/RuanVasco/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('570499966fe3fff126fceacda36ec0b9d385223a057c28fa57462855fa7e9bc7')

build() {
  cd "$pkgname-$pkgver"
  export CFLAGS="-march=x86-64"
  cargo build --release
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$_commitmsg_exec" "$pkgdir/usr/bin/$_commitmsg_exec"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
