# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=geotoad
pkgver=3.27.0
pkgrel=1
pkgdesc="A tool to simplify geocaching"
arch=('any')
url="https://github.com/steve8x8/geotoad"
license=('custom')
depends=('ruby')
source=($pkgname-$pkgver.tar.gz::https://github.com/steve8x8/geotoad/archive/$pkgver.tar.gz)
sha256sums=('2a851e1938d7a1e713cfa4720dcbf2ceaf0266f190a62c728b6def8aea2dcf5b')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  install -d "${pkgdir}"/usr/{bin,share/${pkgname}}
  cp -R * "${pkgdir}"/usr/share/${pkgname}

  echo -e "#!/bin/bash\n\n/usr/share/${pkgname}/geotoad.rb" > "${pkgdir}"/usr/bin/${pkgname}
  chmod 755 "${pkgdir}"/usr/bin/${pkgname}

#license and man file
  install -Dm644 COPYRIGHT.txt "${pkgdir}"/usr/share/licenses/${pkgname}/COPYRIGHT.txt
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1

#removing Debian specific files
  rm -rf "${pkgdir}"/usr/share/$pkgname/debian
}
