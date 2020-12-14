# Maintainer: Arthur Skowronek (0x5a17ed) <0x5a17ed at tuta dot io>

_pkgname=display-switch
pkgname=$_pkgname-git
pkgver=0.3.0.r8.6453919
pkgrel=1
pkgdesc="Switching monitor inputs via DDC/CI based on USB device connect/disconnect events."
url="https://github.com/haimgel/display-switch"
arch=('i686' 'x86_64')
provides=('display-switch')
conflicts=('display-switch')
license=('MIT')
depends=('libusb' 'systemd-libs')
makedepends=('cargo' 'git')
source=("$_pkgname::git+https://github.com/haimgel/display-switch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dt "$pkgdir/usr/bin" target/release/display_switch
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
