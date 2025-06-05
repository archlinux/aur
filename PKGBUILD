# Maintainer: Julianmb <julianmboruta@gmail.com>
pkgname=autosubsync-bin
pkgver=5.8
pkgrel=1
pkgdesc="AutoSubSync is a user-friendly Python tool that helps you easily synchronize subtitle files."
arch=('x86_64')
url="https://github.com/denizsafak/AutoSubSync"
license=('GPL-3.0-or-later')
provides=('autosubsync')

source=(
  "https://github.com/denizsafak/AutoSubSync/releases/download/v${pkgver}/AutoSubSync-v${pkgver}-linux-amd64.tar.gz"
  "autosubsync.desktop"
)

sha256sums=(
  '55e59a882ef8c99a24018dffeb8c36eb7cdd6cfec32cea7ca1b4569825f39142'
  '6f4d823e6ed1f31cc8e544ba944353807462798b5eedbfc8186ced0b8d097d4b'
)

package() {
  mkdir -p "${pkgdir}/opt/${pkgname/-bin/}"
  cp -dpr --no-preserve=ownership "${srcdir}/AutoSubSync-v${pkgver}/_internal" "${pkgdir}/opt/${pkgname/-bin/}"
  cp -dp --no-preserve=ownership "${srcdir}/AutoSubSync-v${pkgver}/AutoSubSync" "${pkgdir}/opt/${pkgname/-bin/}/AutoSubSync"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/autosubsync/AutoSubSync" "${pkgdir}/usr/bin/autosubsync"
  install -D -m644 "autosubsync.desktop" "${pkgdir}/usr/share/applications/autosubsync.desktop"
  chmod -R 755 "${pkgdir}/opt/${pkgname/-bin/}"
}
