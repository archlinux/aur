# Maintainer: William Faircloth <willuhmjs@gmail.com>
pkgname=trs
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI program to manage a trash folder"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/willuhmjs/trs"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')

# Automatically get the latest tag version from Git
source=("git+https://github.com/willuhmjs/trs.git#tag=v$pkgver")
sha256sums=('SKIP')

# Ensure pkgver is set from the latest git tag
pkgver() {
  cd "$srcdir/trs"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

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
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  
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
