# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snd-hdspe-dkms
pkgver=1.0.2
pkgrel=1
pkgdesc='A linux kernel module for RME HDSPe sound cards and extension modules'
url='https://github.com/Schroedingers-Cat/snd-hdspe'
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms')
provides=("snd-hdspe=${pkgver}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Schroedingers-Cat/snd-hdspe/archive/refs/tags/v${pkgver}.tar.gz"
  "dkms.conf"
)
sha256sums=('38cf74f7664c5fe9a9b53d91edee6d8354a13f51143e598fd75128eddeaf4d36'
            '6a135481ba649e0a853b3d68334cb93f869d195495f367c516138b6e7203db6f')

package() {
  cd "${srcdir}/snd-hdspe-${pkgver}"

  install -Dm644 Makefile "$pkgdir/usr/src/${pkgname}-${pkgver}/Makefile"
  install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/${pkgname}-${pkgver}/dkms.conf"
  install -Dm644 sound/pci/hdsp/Makefile "$pkgdir/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/Makefile"
  install -Dm644 sound/pci/hdsp/hdspe/Makefile "$pkgdir/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/hdspe/Makefile"
  install -Dm644 sound/pci/hdsp/hdspe/*.{c,h} -t "$pkgdir/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/hdspe"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README" 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" 
  cp -r doc "$pkgdir/usr/share/doc/${pkgname}/" 
}

# vim: ts=2 sw=2 et:
