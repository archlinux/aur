# Maintainer: Ricardo Funke <ricardo [at] gmail [dot] com>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Iwan Timmer <irtimmer [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Ricardo Band <me [at] xengi [dot] de>
# Contributor: Axilleas Pipinellis (aka axil42) <axilleas [at] archlinux [dot] info>
# Contributor: UshakovVasilii <UshakovVasilii [at] yahoo [dot] com>
# Contributor: Giulio Fidente <gfidente [at] gmail [dot] com>
# Contributor: xantares <xantares09 [at] hotmail [dot] com>

pkgname=popcorntime-bin
pkgver=0.3.7.2
pkgrel=3
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('x86_64' 'i686')
url="http://popcorntime.io/"
license=('GPL3')
depends=('ttf-liberation' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('net-tools: necessary for the new vpn feature')
provides=('popcorntime')
conflicts=('popcorntime')
options=('!strip')
install="popcorntime.install"
sha256sums=('0b294d08e6bc46d3d06717d4a6344b4e6e4e14f742f61101b8498d931d99a952'
            '9e1bc552bb06446689233b1a123d4cc421771673a7b803a980d4149bf4dc38b3'
            'ac2b7183d3ea62ae821c7d1f4b243b0ca41c7838efa16babe29cad0c4958ee25'
            '3dd794302ad0b3a98d48973175b6de9bc632181872df2d0376a19a5cc0aa14a2')

_platform=Linux64

if [ "$CARCH" = 'i686' ]; then
  _platform=Linux32
  sha256sums[0]='21e5dbc667f13572fcd8edc535ce4fcd2c0bffafcd237753ad8a2f1cc665e1b7'
fi

source=("http://get.popcorntime.io/build/Popcorn-Time-${pkgver}-${_platform}.tar.xz"
        "icon.png"
        "popcorntime.install"
        "popcorntime.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program
  echo "${pkgdir}/opt/${pkgname}/"
  install -Dm755 ${srcdir}/Popcorn-Time		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 ${srcdir}/nw.pak		"${pkgdir}/opt/${pkgname}/"
  install -Dm644 ${srcdir}/libffmpegsumo.so	"${pkgdir}/opt/${pkgname}/"
  install -Dm644 ${srcdir}/package.nw		"${pkgdir}/opt/${pkgname}/"

  # Link to program
  ln -s "/opt/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/popcorntime"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}
