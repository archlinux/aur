# Maintainer: anispwyn <anisphia_wynn_palettia@proton.me>

pkgname=sleepy-launcher-bin
pkgver=1.3.0
pkgrel=2
pkgdesc="Sleepy game launcher for Linux with telemetry disabling"
url="https://github.com/an-anime-team/sleepy-launcher"
conflicts=("sleepy-launcher")
provides=("sleepy-launcher")
arch=("x86_64")
license=("GPL-3.0-only")

depends=(
  "libadwaita"
  "xdg-desktop-portal"
  "libwebp"
  "p7zip"
  "git"
  "gtk4"
  "glibc"
)

optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
  "sleepy-launcher_${pkgver}::https://github.com/an-anime-team/sleepy-launcher/releases/download/${pkgver}/sleepy-launcher"
  "icon.png"
  "sleepy-launcher.desktop"
)

md5sums=('7ca43cdfb5121c61366e2787e0161727'
  '808f0ccaac7bac70b56e400760f0b764'
  'a039b4bdbc28710d8784c84e2da16785')

prepare() {
  chmod +x "${srcdir}/sleepy-launcher_${pkgver}"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"
  cp sleepy-launcher_${pkgver} "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/sleepy-launcher.png"
  ln -s "/usr/lib/${pkgname}/sleepy-launcher_${pkgver}" "${pkgdir}/usr/bin/sleepy-launcher"
  install -Dm644 "${srcdir}/sleepy-launcher.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.sleepy-launcher.png"
}
