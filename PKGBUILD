# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=fastsapp
pkgver=0.1.5
pkgrel=1
pkgdesc="Fast native WhatsApp client built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/fastsapp"
license=('MIT')
install="${pkgname}.install"
# Nothing beyond libc is linked directly; winit and glutin dlopen these at
# startup, and this is a GUI-only application, so all of them have to be
# there for it to run at all.
depends=('libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'ffmpeg: playing GIFs'
            'xdg-desktop-portal: the file picker for attachments')
conflicts=('fastsapp-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/fastsapp"
source_x86_64=("${_repo}/releases/download/v${pkgver}/fastsapp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/fastsapp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('595962582297ef94a8692545767b7ce043fdd2a09c6876cf000b406c29a0c4c7')
sha256sums_aarch64=('bce8a2505a835d43b6aca868efea130effb390b3e63a68763fcb8aaa98fcf45c')

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
