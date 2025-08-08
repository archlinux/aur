pkgname=folder-size
pkgver=0.1.0.4.g786a747
pkgrel=1
pkgdesc="A CLI tool to calculate folder sizes with options like symlink following and depth limits"
arch=('x86_64')
url="https://github.com/venoosoo/folder-size"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("git+https://github.com/venoosoo/folder-size.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/folder-size"
  git describe --tags --always | sed 's/^v//; s/-/./g'
}

build() {
  cd "$srcdir/folder-size"
  cargo build --release
}

package() {
  cd "$srcdir/folder-size"
  install -Dm755 "target/release/folder_size" "$pkgdir/usr/bin/folder-size"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

