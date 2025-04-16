# Maintainer: William Faircloth <willuhmjs@gmail.com>
pkgname=trs-git
pkgver=r$(git rev-list --count HEAD).c$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="A CLI program to manage a trash folder"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/willuhmjs/trs"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')

# Automatically fetch the latest version from the git repository
source=("git+https://github.com/willuhmjs/trs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/trs"
  cargo build --release
}

check() {
  cd "$srcdir/trs"
  cargo test --release
}

package() {
  cd "$srcdir/trs"
  
  # Install the binary 
  install -Dm755 target/release/trs "$pkgdir/usr/bin/trs"
  
  # Create documentation directory
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  
  # Add a README if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
  
  # Add a license file if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
