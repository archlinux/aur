# Maintainer: Can H. Tartanoglu <caniko@codeberg.org>
# Maintainer GPG key: 818D507F1E62139F8A17EAA64623DEA06FDACFE1
pkgname=modde
pkgver=0.4.0
pkgrel=1
pkgdesc='Cross-platform game mod manager'
arch=('x86_64')
url='https://codeberg.org/caniko/rs-modde'
license=('GPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc' 'libxkbcommon' 'openssl' 'sqlite' 'vulkan-icd-loader' 'wayland')
makedepends=('cargo' 'cmake' 'pkgconf' 'rust')
conflicts=('modde-bin' 'modde-git')
source=("rs-modde-${pkgver//_/-}.tar.gz::https://codeberg.org/caniko/rs-modde/archive/${pkgver//_/-}.tar.gz")
sha256sums=('b0fd3522892406d018a86cd82219e0356e82642c67fd4ba6525cb71dbc5d6e6c')

build() {
  cd rs-modde
  cargo build --release --locked --bin modde --bin modde-ui
}

package() {
  cd rs-modde
  install -Dm755 target/release/modde "$pkgdir/usr/bin/modde"
  install -Dm755 target/release/modde-ui "$pkgdir/usr/bin/modde-ui"
  install -Dm644 dist/modde-ui.desktop "$pkgdir/usr/share/applications/com.tartanoglu.modde.desktop"
  install -Dm644 dist/com.tartanoglu.modde.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.tartanoglu.modde.png"
  install -Dm644 dist/com.tartanoglu.modde.metainfo.xml "$pkgdir/usr/share/metainfo/com.tartanoglu.modde.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
