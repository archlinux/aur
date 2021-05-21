# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=szyszka-git
_name="${pkgname%-git}"
pkgver=1.0.0.r9.g90182af
pkgrel=1
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk3')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  cargo build --release --locked --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dvm 755 "target/release/$_name" -t "$pkgdir/usr/bin/"
  install -Dvm 644 "data/com.github.qarmin.$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dvm 644 "data/icons/com.github.qarmin.$_name.png" -t "$pkgdir/usr/share/icons/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

