# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgbase=czkawka
pkgname=('czkawka-cli' 'czkawka-gui')
pkgver=3.2.0
pkgrel=1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc. '
url='https://github.com/qarmin/czkawka'
arch=('x86_64')
makedepends=('cargo' 'rust' 'git' 'gtk3')
_commit=243505b692a0d36233645de4a5207ec477a4761c # tags/3.2.0^0
source=("git+https://github.com/qarmin/czkawka.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${pkgbase}
  cargo build --bin czkawka_cli --release
  cargo build --bin czkawka_gui --release
}

check() {
  cd ${pkgbase}
  cargo test --bin czkawka_cli --release
  cargo test --bin czkawka_gui --release
}

package_czkawka-cli() {
  depends=('bzip2')
  license=('MIT')

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE"
  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_cli" \
        "${pkgdir}/usr/bin/czkawka_cli"
}

package_czkawka-gui() {
  depends=('gtk3')
  license=('MIT')

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE"
  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_gui" \
        "${pkgdir}/usr/bin/czkawka_gui"
  install -Dm644 "${srcdir}/czkawka/pkgs/com.github.qarmin.czkawka.desktop" \
        "${pkgdir}/usr/share/applications/com.github.qarmin.czkawka.desktop"
}
