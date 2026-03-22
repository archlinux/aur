# Maintainer: CPT-Dawn <dawnsp0456@gmail.com>
pkgname=lucent
_reponame=Lucent
pkgver=1.0.2
pkgrel=1
pkgdesc="A blazing-fast, D-Bus activated Wayland notification daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('glib2' 'gtk4' 'gtk4-layer-shell' 'dbus')
makedepends=('cargo')
provides=("lucent")
conflicts=("lucent-git")
source=("https://github.com/CPT-Dawn/Lucent/archive/refs/tags/v1.0.2.tar.gz")
sha256sums=('ea2a51eae637e454bf9f5d14cfe6a30a918bc22051e076e434c2fdaf4c4d8878')

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
