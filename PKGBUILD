# Submitter: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Kusoneko <kusoneko at kusoneko dot moe>

pkgname=szyszka-git
pkgver=3.0.0.r2.gfb6938c
pkgrel=1
pkgdesc="A simple but powerful batch file rename program"
arch=('x86_64')
url="https://github.com/qarmin/szyszka"
license=('MIT')
depends=('gtk4')
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
  install -Dm 755 target/release/szyszka -t "$pkgdir/usr/bin/"
  install -Dm 644 data/com.github.qarmin.szyszka.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm 644 data/icons/com.github.qarmin.szyszka.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm 644 data/com.github.qarmin.szyszka.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
