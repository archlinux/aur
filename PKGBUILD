# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise-bin'
pkgdesc='Highly accurate C64/Amiga emulator - binary release'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.8
pkgrel=1

_pkgname='denise'
_filename="${_pkgname}_ubuntu2204_v${pkgver}"
source=("$pkgname-$pkgver.deb::https://sourceforge.net/projects/deniseemu/files/v${pkgver}/${_filename}.deb")
sha256sums=('6ac23ca8a50031c8861c770b01ba059ab4a9841df11423a4576ac2e0a89ea4ee')

provides=('denise')
conflicts=('denise')
depends=('gtk3' 'openal' 'libpulse')
arch=('x86_64')

prepare() {
  tar -xf ${srcdir}/data.tar.zst
}

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share

  install -Dm755 usr/local/bin/denise ${pkgdir}/usr/bin/${_pkgname}
  cp -r usr/local/share/${_pkgname} ${pkgdir}/usr/share/${_pkgname}
  cp -r usr/local/share/applications ${pkgdir}/usr/share/applications
  cp -r usr/local/share/icons ${pkgdir}/usr/share/icons
}
