# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise-bin'
pkgdesc='Highly accurate C64/Amiga emulator - binary release'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.7
pkgrel=1

_pkgname='denise'
_filename="${_pkgname}_ubuntu2004_v${pkgver}"
source=("$pkgname-$pkgver.deb::https://sourceforge.net/projects/deniseemu/files/v%20${pkgver}/${_filename}.deb")
sha256sums=('bb8fe6089a448283c53441f5c54c363ef45b21d44b54a36e8f949b20397f5bb0')

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
