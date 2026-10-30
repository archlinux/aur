# Maintainer: Tim Falken <tim@timfalken.com>
# De CI (scripts/ci/publish-aur.sh) zet pkgver, _tag en sha256sums.
pkgname=legacycycles-bin
pkgver=0.0.37
pkgrel=1
_tag=v0.0.37
pkgdesc='TRON Legacy-style light cycle game (prebuilt binary; bike model compiled in)'
arch=('x86_64')
url='https://git.timfalken.com/timfa/legacy-cycles'
license=('MIT')
# libxkbcommon, libxcb, libX11-xcb en libvulkan worden ge-dlopend.
depends=('gcc-libs' 'glibc' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'wayland' 'alsa-lib' 'systemd-libs' 'vulkan-icd-loader')
# Tot v0.0.31 heette dit AUR-pakket legacy-cycles-bin. conflicts laat
# pacman/yay het oude pakket bij installatie verwijderen (zelfde bestanden),
# provides houdt pakketten die de oude naam vragen tevreden, replaces doet
# alleen iets in een sync-repo maar legt de opvolging correct vast.
provides=('legacy-cycles' 'legacy-cycles-bin')
conflicts=('legacy-cycles' 'legacy-cycles-bin')
replaces=('legacy-cycles-bin')
options=('!strip' '!debug')
_local=('legacy-cycles.desktop' 'legacy-cycles.png')
source=("legacy-cycles-${_tag}-linux-x86_64.tar.gz::${url}/-/releases/${_tag}/assets/legacy-cycles-${_tag}-linux-x86_64.tar.gz"
        "${_local[@]}")
sha256sums=('fb950697d455f2d5d7049c4695ef1f96979692b05c468d64502e6886e2d04e0b' 'a2819a75c6992e052b36bf6b58fb400df51e6a3245ad09bba4982d71310d8554' '596339b8ef4f3c68221d361659eba3b427d19b270d19b5d227595140557034cb')

package() {
  cd "$srcdir/legacy-cycles-${_tag}-linux-x86_64"
  install -Dm755 legacy-cycles "$pkgdir/usr/bin/legacy-cycles"
  install -Dm644 "$srcdir/legacy-cycles.desktop" "$pkgdir/usr/share/applications/legacy-cycles.desktop"
  install -Dm644 "$srcdir/legacy-cycles.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/legacy-cycles.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
