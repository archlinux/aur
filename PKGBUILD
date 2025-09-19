# Maintainer: Julianmb <julianmboruta@gmail.com>
# Generate .SRCINFO file: makepkg --printsrcinfo > .SRCINFO
pkgname=autosubsync-bin
pkgver=6.1
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
  '6204986ff8610333c46ac7b796e17652e24768ed23e72c6f53c7206c358acc92'
  'f123dc193f6c2a4362cfd84dde2f58a10311b0947b9550355b78e7deac1cdf03'
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
