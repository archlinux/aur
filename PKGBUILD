# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snd-hdspe-dkms
pkgver=1.0.1
pkgrel=2
pkgdesc='A linux kernel module for RME HDSPe sound cards and extension modules'
url='https://github.com/Schroedingers-Cat/snd-hdspe'
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms')
provides=("snd-hdspe=${pkgver}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Schroedingers-Cat/snd-hdspe/archive/refs/tags/v${pkgver}.tar.gz"
  "dkms.conf"
  "fix-timer-api.patch"
)
sha256sums=('e7a4217c0f848c06d3d22d36b9ddc9feedc71f7ea419a003829e36de334a40dd'
            '6a135481ba649e0a853b3d68334cb93f869d195495f367c516138b6e7203db6f'
            'f96bf3aa966ea135767c857e107c7f11373668d2096146b4576e9b33d0e1a0e0')

prepare() {
  cd "${srcdir}"
  patch -Np1 -i fix-timer-api.patch
}

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
