# Maintainer: wbunting

pkgname=webmenu-git
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple webview renderer for html list items"
url="https://github.com/wbunting/webmenu"
arch=("x86_64")
license=("GPL")
provides=("webmenu")
options=("strip")
source=("git+$url")
sha256sums=("SKIP")
makedepends=('git' 'webkit2gtk' 'appmenu-gtk-module' 'gtk3' 'squashfs-tools' 'npm' 'cargo')

pkgver() {
  cd webmenu
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.r0.*$//'
}

build() {
  cd webmenu
  yarn install
  yarn build
  cargo build --release
}

package() {
  cd webmenu
  install -Dt "$pkgdir/usr/bin" target/release/webmenu
  install -Dm664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm664 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
