# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=rx-git
pkgver=0.2.0+r112+gdef829f
pkgrel=1
pkgdesc='Extensible Rust-based pixel editor (git)'
arch=(i686 x86_64)
url=http://cloudhead.io/rx/
license=(GPL3)
depends=(libx11 desktop-file-utils)
makedepends=(git rust cmake glfw-x11)
source=(git+https://github.com/cloudhead/rx)
sha512sums=('SKIP')

pkgver() {
  cd rx
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd rx
  cargo build --locked --release
}

package() {
  cd rx

  install -D target/release/rx -t "$pkgdir"/usr/bin
  install -Dm 644 README -t "$pkgdir"/usr/share/doc/rx

  install -Dm 644 rx.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 rx.png -t "$pkgdir"/usr/share/pixmaps
}
