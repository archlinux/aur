# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise-bin'
pkgdesc='Highly accurate C64/Amiga emulator - binary release'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.9
pkgrel=1

_pkgname='denise'
_filename="${_pkgname}_ubuntu2204_v${pkgver}"
source=("$pkgname-$pkgver.deb::https://github.com/piciji/denise/releases/download/v${pkgver}/${_filename}.deb")
sha256sums=('2393588cb68f0540662a1a64a25fd54045b9bb57c9685d86301c4fd4769bb65e')

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
