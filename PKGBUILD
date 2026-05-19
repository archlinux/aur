# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=zodiac-bin
_pkgname=zodiac
pkgver=0.7.1
pkgrel=1
pkgdesc='Modern, nice software for astrologers.'
arch=('x86_64')
url="https://sourceforge.net/projects/${_pkgname}-app"
license=('GPL-3.0-only')
depends=('qt4' 'qt6-declarative')
conflicts=('zodiac')
provides=('zodiac')
source=("${url}/files/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d010acccc764f453b080a4aaf695002b840f0a450648a3913bffb86789de865d')

package() {
  #create directories in the destination:
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/lib/${pkgname}
  
  
  #copy files from the binary (src) to the destination:
  cd "$srcdir/"
  cp -r ./bin $pkgdir/usr/lib/${pkgname}
  
  #as a final step, construct an executable script in /usr/bin:
  touch $pkgdir/usr/bin/${_pkgname}
  chmod 755 $pkgdir/usr/bin/${_pkgname}
  echo "#!/bin/sh" >> $pkgdir/usr/bin/${_pkgname}
  echo "cd /usr/lib/zodiac-bin/bin/" >> $pkgdir/usr/bin/${_pkgname}
  echo 'exec ./zodiac "$@"' >> $pkgdir/usr/bin/${_pkgname}
}
