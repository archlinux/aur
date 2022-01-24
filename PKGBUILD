# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgbase=czkawka
pkgname=('czkawka-cli' 'czkawka-gui')
pkgver=4.0.1
pkgrel=1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc. '
url='https://github.com/qarmin/czkawka'
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'rust' 'git' 'gtk3')
_commit=c7ff65c11ae46c774970be5c5f263cf8d746223b # tags/4.0.1^0
source=("git+https://github.com/qarmin/czkawka.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
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

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE"
  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_cli" \
        "${pkgdir}/usr/bin/czkawka_cli"
}

package_czkawka-gui() {
  depends=('gtk3')

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE"

  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_gui" \
        "${pkgdir}/usr/bin/czkawka_gui"

  install -Dm644 "${srcdir}/czkawka/data/com.github.qarmin.czkawka.desktop" \
        "${pkgdir}/usr/share/applications/com.github.qarmin.czkawka.desktop"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.Devel.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.Devel.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka-symbolic.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.github.qarmin.czkawka-symbolic.svg"

  install -Dm644 "${srcdir}/czkawka/data/com.github.qarmin.czkawka.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/com.github.qarmin.czkawka.metainfo.xml"
}
