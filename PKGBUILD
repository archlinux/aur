# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=rust-qt-binding-generator-git
pkgver=0.3.4.r331.874d6c3
pkgrel=1
pkgdesc='Generate code to build Qt applications with Rust'
arch=('x86_64')
url='https://phabricator.kde.org/source/rust-qt-binding-generator'
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('rust-qt-binding-generator')
conflicts=('rust-qt-binding-generator')
source=('git+http://anongit.kde.org/rust-qt-binding-generator.git')
sha512sums=('SKIP')

pkgver() {
  cd rust-qt-binding-generator
  printf "%s.r%s.%s" "$(grep --max-count=1 version Cargo.toml | cut --delimiter='"' --fields=2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd rust-qt-binding-generator
  cargo build --release
}

check() {
  cd rust-qt-binding-generator
  cargo test --release
}

package() {
  cd rust-qt-binding-generator

  install -Dm755 ${srcdir}/rust-qt-binding-generator/target/release/rust_qt_binding_generator ${pkgdir}/usr/bin/rust_qt_binding_generator
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/rust-qt-binding-generator/COPYING
  install -Dm644 COPYING.EXCEPTION ${pkgdir}/usr/share/licenses/rust-qt-binding-generator/COPYING.EXCEPTION
# install -Dm644 org.kde.rust_qt_binding_generator.desktop ${pkgdir}/usr/share/applications/org.kde.rust_qt_binding_generator.desktop
# install -Dm644 org.kde.rust_qt_binding_generator.appdata.xml ${pkgdir}/usr/share/metainfo/org.kde.rust_qt_binding_generator.appdata.xml
}
