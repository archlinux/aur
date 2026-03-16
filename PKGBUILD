# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher-bin
_pkgname=PandoraLauncher-Linux
pkgver=4.0.1
pkgrel=1
pkgdesc="A modern Minecraft launcher that balances ease-of-use with powerful instance management features."
arch=('x86_64')
provides=("pandora-launcher")
conflicts=("pandora-launcher")
url="http://pandora.moulberry.com/"
license=('MIT')
options=(!strip)
depends=(
  'libxkbcommon-x11'
  'vulkan-tools'
  'wayland'
  'libxkbcommon'
  'libxcb'
  'vulkan-icd-loader'
  'vulkan-driver'
  'openssl'
)
optdepends=(
  'flite: minecraft narrator support'
  'orca: minecraft screen reader'
  'gamemode: gamemode support'
  'mangohud: mangohud support'
)
source=(
  "pandora-launcher-$pkgver.deb::https://github.com/Moulberry/PandoraLauncher/releases/download/v$pkgver/PandoraLauncher-Linux-x86_64_${pkgver}_amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/LICENSE"
  "icon.svg::https://raw.githubusercontent.com/Moulberry/PandoraLauncher/refs/tags/v$pkgver/package/windows.svg"
  "$pkgname.desktop"
)
sha256sums=('d8778f4f6b75b4e82f69594ca30e89a0eb0d5f721d0184ac8e8f205f7f7a7a21'
            'a416ff7bf8fca263a47d8256c154c4405df3502506520613500bed0cb6eb86a8'
            '8c045dbd40e52ee10f439e90f368ef4a12c0f3f830f252b2fefd2e862bc76fc5'
            '8ae5fa2476e937d0fdc1e53bacb62d8a5ac333d98f17da987d13b25e1a1afe31')

package() {
  install -d "pandora-launcher-$pkgver"
  bsdtar -xf "data.tar.gz" -C "pandora-launcher-$pkgver"
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 pandora-launcher-$pkgver/usr/bin/${_pkgname}-x86_64 "$pkgdir/usr/bin/${pkgname::-4}"
  install -Dm644 "icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname::-4}.svg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
}
