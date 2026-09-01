# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=fastsapp-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast native WhatsApp client built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/fastsapp"
license=('MIT')
install="${pkgname}.install"
# Nothing beyond libc is linked directly; winit and glutin dlopen these at
# startup, and this is a GUI-only application, so all of them have to be
# there for it to run at all.
depends=('alsa-lib' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
provides=('fastsapp')
conflicts=('fastsapp' 'fastsapp-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/fastsapp"
source_x86_64=("${_repo}/releases/download/v${pkgver}/fastsapp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/fastsapp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('52ec65a20225fcda1b6337a281255f9288510ce7ecd1f01741aeaf527022e4c9')
sha256sums_aarch64=('3a2f02e79480923861367b86021d54ad0a76a4df6fb8b472b93f0ac0a5619411')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/fastsapp-v${pkgver}-${target}"

  install -Dm755 "${dir}/fastsapp" "${pkgdir}/usr/bin/fastsapp"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/fastsapp.desktop" \
    "${pkgdir}/usr/share/applications/fastsapp.desktop"
  install -Dm644 "${dir}/packaging/icons/fastsapp.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/fastsapp.svg"
}
