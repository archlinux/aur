# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pacman-hook-dkms
pkgver=1.0
pkgrel=2
pkgdesc='Install/remove dkms modules upon kernel upgrades/removals'
arch=('any')
url='https://github.com/alucryd/pachooks'
license=('BSD')
depends=('pacman')
_commit='4f5cc1389e23c3c9b0995aef2b4656d337a73d6b'
source=("git+https://github.com/alucryd/pachooks.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd pachooks

  sed 's/alpm/libalpm/' -i hooks/dkms*
}

package() {
  cd pachooks

  install -dm 755 "${pkgdir}"/usr/share/libalpm/hooks{,.bin}
  install -m 644 hooks/dkms* "${pkgdir}"/usr/share/libalpm/hooks/
  install -m 755 scripts/dkms* "${pkgdir}"/usr/share/libalpm/hooks.bin/

  install -dm 755 "${pkgdir}"/usr/share/licenses/pacman-hook-dkms
  install -m 644 README.pod "${pkgdir}"/usr/share/licenses/pacman-hook-dkms/
}

# vim: ts=2 sw=2 et:
