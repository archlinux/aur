# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=geotoad
pkgver=3.22.0
pkgrel=1
pkgdesc="A tool to simplify geocaching"
arch=('any')
url="http://geotoad.googlecode.com/"
license=('custom')
depends=('ruby')
source=(http://geotoad.googlecode.com/svn/branches/downloads/files/$pkgname-$pkgver.tar.gz)
sha256sums=('a190dbdf07b71ac27de2b6c3ff57325dead5ccc9e4dd6bc9baa169671ef6efaf')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  install -d "${pkgdir}"/usr/{bin,share/${pkgname}}
  cp -R * "${pkgdir}"/usr/share/${pkgname}

  echo -e "#!/bin/bash\n\n/usr/share/${pkgname}/geotoad.rb" > "${pkgdir}"/usr/bin/${pkgname}
  chmod 755 "${pkgdir}"/usr/bin/${pkgname}

#license and man file
  install -D -m644 COPYRIGHT.txt "${pkgdir}"/usr/share/licenses/${pkgname}/COPYRIGHT.txt
  install -D -m644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1

#removing Debian specific files
  rm -rf "${pkgdir}"/usr/share/$pkgname/debian
}
