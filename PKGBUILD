# Maintainer: czyt <czytcn@gmail.com>
pkgname=wu-bin
pkgver=1.1.10
pkgrel=1
pkgdesc="Fast, native code editor in Rust that feels like VS Code"
arch=('x86_64' 'aarch64')
url="https://github.com/farshed/wu"
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'git: Git integration'
)
provides=('wu')
conflicts=('wu')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/wu-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/wu-linux-aarch64.tar.gz")
sha256sums_x86_64=('09f2cb1612e31ad41a1f0f286ad98a4959aecadd826df60ebfcd99d40999b4e9')
sha256sums_aarch64=('69bfdbf58f2ac82c70d696b24d68ce3a25bbe82081b8ee35b76336e755f1c55f')

package() {
  # Use Arch's system XCB/XKB libraries instead of the copies in wu.app/lib.
  install -Dm755 "${srcdir}/wu.app/bin/wu" "${pkgdir}/usr/lib/wu/bin/wu"
  install -Dm755 "${srcdir}/wu.app/libexec/wu-editor" "${pkgdir}/usr/lib/wu/libexec/wu-editor"
  install -Dm644 "${srcdir}/wu.app/licenses.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.md"

  install -Dm644 "${srcdir}/wu.app/share/applications/me.farshed.Wu.desktop" \
    "${pkgdir}/usr/share/applications/me.farshed.Wu.desktop"
  install -Dm644 "${srcdir}/wu.app/share/icons/hicolor/512x512/apps/wu.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/wu.png"
  install -Dm644 "${srcdir}/wu.app/share/icons/hicolor/1024x1024/apps/wu.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/wu.png"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/wu/bin/wu "${pkgdir}/usr/bin/wu"
}
