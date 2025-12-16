# Maintainer: Nguyen Hoang Ky <nhktmdzhg at google mail>
pkgname=doasedit-nhk
_pkgname=doasedit
pkgver=1.1.0
pkgrel=1
pkgdesc="A Rust implementation of doasedit - edit files as root using an unprivileged editor"
arch=('any')
url="https://github.com/nhktmdzhg/doasedit"
license=('MIT')
depends=('glibc')
makedepends=('rust')
conflicts=(doasedit)
provides=(doasedit)
source=("git+https://github.com/nhktmdzhg/doasedit.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"

  # Install binary
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install man page
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
