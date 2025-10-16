pkgname=arch-sandbox
_pkgver=2.0.0 # This must match the tag you created in Phase 1
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Create and manage isolated Arch Linux sandboxes with ease" # From your README.md
arch=('x86_64' 'aarch64')
url="https://github.com/OminduD/arch-sandbox" # From your go.mod and README.md
license=('MIT')                               # From your LICENSE file

# These are the runtime dependencies from your README and source code
depends=('arch-install-scripts' 'git' 'zstd')

# This is the build dependency
makedepends=('go')

# This downloads the source tarball from the Git tag you made
source=("$pkgname-$_pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/refs/tags/v$_pkgver.tar.gz")

# This will be filled in by the next command
sha256sums=('2c5204607df101c2dd69f7f9f1536f6cfd333fe99bd6efdf8788f8e2a33b51c2')

# Build command from your README.md
build() {
  cd "$pkgname-$_pkgver"
  go build -v -o "$pkgname"
}

# Package command to install the binary and license
package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
