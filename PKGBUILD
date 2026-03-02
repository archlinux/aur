pkgname=lucent
_reponame=Lucent
pkgver=1.0.0
pkgrel=1
pkgdesc="A blazing-fast, D-Bus activated Wayland notification daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('glib2' 'gtk4' 'gtk4-layer-shell' 'dbus')
makedepends=('cargo')
provides=("lucent")
conflicts=("lucent-git")
source=("https://github.com/CPT-Dawn/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f86feb88a9e1b4f1bc97e0d87748bb0d182b150837b7a6d37a4620dfe760201')

build() {
  cd "${_reponame}-${pkgver}"
  export CARGO_TARGET_DIR="target"
  cargo build --release --locked
}

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm755 "target/release/lucent" "${pkgdir}/usr/bin/lucent"
  
  install -Dm644 \
    "org.freedesktop.Notifications.service" \
    "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Notifications.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}