# Maintainer: John Dennehy <your@email.com>
pkgname=bow-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Put a bow on your package management. A beautiful cross-platform CLI front-end."
arch=('x86_64')
url="https://github.com/john-dennehy/bow"
license=('MIT') # Or whatever license you plan to use
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('bow')
conflicts=('bow')
source=("git+https://github.com/john-dennehy/bow.git")
sha256sums=('SKIP')

# Automatically updates the pkgver to match your Cargo.toml
pkgver() {
  cd "$srcdir/bow"
  printf "%s" "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)"
}

build() {
  cd "$srcdir/bow"
  # Build the optimized release binary
  cargo build --release --locked
}

package() {
  cd "$srcdir/bow"
  # Install the binary into the virtual package root
  install -Dm755 "target/release/bow" "$pkgdir/usr/bin/bow"
  
  # Optional: If you add a LICENSE file later, you can install it too
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
