# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>

pkgname="devpod-community-bin"
pkgver=0.8.12
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - community fork (prebuilt) - unofficial package"
arch=("x86_64")
url="https://github.com/skevetter/devpod"
license=("MPL-2.0")
options=(!strip)

depends=(
  "gdk-pixbuf2"
  "webkit2gtk-4.1"
  "cairo"
  "glib2"
  "gtk3"
  "pango"
  "hicolor-icon-theme"
  "gcc-libs"
  "libsoup3"
  "glibc"
  "libayatana-appindicator"
)

# This fork installs the same binaries as upstream, so it MUST conflict.
provides=("devpod" "devpod-cli")
conflicts=("devpod" "devpod-bin" "devpod-cli-bin")

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('fd2d8d96047cc50a3ea77ca79c9366164ad26f3ebad7dcff4767c81b2fe239f9')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/usr/bin/dev-pod-desktop" "${pkgdir}/usr/bin/dev-pod-desktop"
  install -Dm755 "${srcdir}/usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"

  install -Dm644 "${srcdir}/usr/share/applications/DevPod.desktop" \
    "${pkgdir}/usr/share/applications/DevPod.desktop"

  install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/dev-pod-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dev-pod-desktop.png"
  install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/dev-pod-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev-pod-desktop.png"
  install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod-desktop.png"
}
