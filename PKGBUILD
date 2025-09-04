# Maintainer: savew (savew@savew.dev)

pkgname=ffetch-git
pkgver=r123.abcdefg 
pkgrel=1
pkgdesc="CLI tool to fetch system info. (Git version)"
arch=('x86_64')
url="https://github.com/0l3d/ffetch"
license=('GPL3')
depends=('pciutils' 'xorg-xprop' 'coreutils')
makedepends=('git' 'rust' 'cargo')
provides=('ffetch')
conflicts=('ffetch-bin')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ffetch"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ffetch"
  cargo build --release --locked
}

package() {
  cd "$srcdir/ffetch"
  install -Dm755 "target/release/ffetch" "$pkgdir/usr/bin/ffetch"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
