# Maintainer: Julianmb <julianmboruta@gmail.com>
# Generate .SRCINFO file: makepkg --printsrcinfo > .SRCINFO
pkgname=autosubsync-bin
pkgver=6.0
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
  '790b53892d1310b8a367121caee030b4c2eeddfaa0cd3cea1df4847e94581e07'
  'f5ad7e8cc84efe46566e1ceb73de2f202188583c0d4116f4c21aa75f43f5b855'
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
