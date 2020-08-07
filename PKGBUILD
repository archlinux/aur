# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_gitname=rust-qt-binding-generator
pkgname=rust-qt-binding-generator-git
pkgver=r365.41713b4
pkgrel=1
pkgdesc='Generate code to build Qt applications with Rust'
arch=('x86_64')
url='https://invent.kde.org/sdk/rust-qt-binding-generator'
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('rust-qt-binding-generator')
conflicts=('rust-qt-binding-generator')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd ${srcdir}/${_gitname}
  cargo build --release
}

check() {
  cd ${srcdir}/${_gitname}
  cargo test --release
}

package() {
  cd ${srcdir}/${_gitname}
  install -Dm755 ${srcdir}/rust-qt-binding-generator/target/release/rust_qt_binding_generator ${pkgdir}/usr/bin/rust_qt_binding_generator
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/rust-qt-binding-generator/COPYING
  install -Dm644 COPYING.EXCEPTION ${pkgdir}/usr/share/licenses/rust-qt-binding-generator/COPYING.EXCEPTION
}
