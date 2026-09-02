# Maintainer: K-Black <k-black@k-black.top>
pkgname=splayer-next-bin
pkgver=1.1.0
pkgrel=1
options=('!debug')
pkgdesc="A modern cross-platform music player built with Electron, Vue 3, and TypeScript"
arch=('x86_64')
url="https://github.com/SPlayer-Dev/SPlayer-Next"
license=('AGPL-3.0-only')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'libsecret'
)
provides=('splayer-next')
conflicts=('splayer-next')
replaces=('splayer-next')
source=(
  "https://github.com/SPlayer-Dev/SPlayer-Next/releases/download/v${pkgver}/splayer-next-${pkgver}-x64.pacman"
  "https://raw.githubusercontent.com/SPlayer-Dev/SPlayer-Next/dev/LICENSE"
)
sha256sums=(
  'd9ef2c3b295425e73ef1fa0d71c77f42647f85549ca2cc01422c38f6463a6853'
  '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182'
)

package() {
  bsdtar -xf "$srcdir/splayer-next-${pkgver}-x64.pacman" -C "$pkgdir"
  rm -f \
    "${pkgdir}/.PKGINFO" \
    "${pkgdir}/.MTREE" \
    "${pkgdir}/.INSTALL"
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/SPlayer-Next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
