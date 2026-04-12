pkgname=inspectors-desktop
_tag=v0.1.0-alpha.1
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc='Linux-first Tauri operator app for the Agent Computer Use Platform'
arch=('x86_64' 'aarch64')
url='https://github.com/OneNoted/inspectors'
license=('MIT')
depends=('glib-networking' 'gtk3' 'libsoup3' 'nodejs>=22' 'webkit2gtk-4.1')
makedepends=('cargo' 'pkgconf')
conflicts=('inspectors-desktop-git')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('f66e7044ae13639f1348b122b2c8a412b2cb55d84f98e69a1830432a4187878a')

build() {
  cd "$srcdir/inspectors-${_tag#v}"
  cargo build --release --locked --package desktop-app --bin inspectors-desktop
}

check() {
  cd "$srcdir/inspectors-${_tag#v}"
  cargo test --locked --package desktop-app
}

package() {
  cd "$srcdir/inspectors-${_tag#v}"
  install -Dm755 target/release/inspectors-desktop "$pkgdir/usr/bin/inspectors-desktop"
  install -Dm644 crates/desktop-app/packaging/inspectors.desktop \
    "$pkgdir/usr/share/applications/inspectors.desktop"
  install -Dm644 crates/desktop-app/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/inspectors.png"
}
