# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=lucent
_reponame=Lucent
pkgver=1.1.0
pkgrel=1
pkgdesc="A blazing-fast, D-Bus activated Wayland notification daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('glib2' 'gtk4' 'gtk4-layer-shell' 'dbus')
makedepends=('cargo')
provides=("lucent")
conflicts=("lucent-git")
source=("https://github.com/CPT-Dawn/Lucent/archive/refs/tags/v1.1.0.tar.gz")
sha256sums=('2e77c3903a3563de8b8a02f365243659cacd01716ef4a4cd327f3f7fbf962d78')

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
