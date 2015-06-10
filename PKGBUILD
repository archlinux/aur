# Maintainer: ianux <ianux@free.fr>

pkgname=opencinematools
pkgver=1.1.2
pkgrel=2
pkgdesc="Tools for the creation of digital cinema packages"
arch=('i686' 'x86_64')
url="https://code.google.com/p/opencinematools/"
license=('BSD')
depends=('asdcplib' 'expat' 'libtiff' 'openjpeg' 'openssl')
source=("https://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}-src.zip" "Makefile")
sha256sums=('56737d2874c2d33a4a8083b372af8bf39c7b3959e0fd5e14555b27a5ebbf7d0f'
            '88e36b0b56adc2e0b8f62d0945537bb625b6d8148e6e62b0f2370a366608bddd')

build() {
  cd ${pkgname}-${pkgver}
  sed -i 's/ADesc.SampleRate/ADesc.EditRate/g' ./src/mkcpl.cpp
  cd build/unix
  cp ${srcdir}/Makefile .
  make mkcpl mkpkl mkmap
}

package() {
  cd ${pkgname}-${pkgver}
  install -D -m755 bin/mkcpl ${pkgdir}/usr/bin/mkcpl
  install -D -m755 bin/mkpkl ${pkgdir}/usr/bin/mkpkl
  install -D -m755 bin/mkmap ${pkgdir}/usr/bin/mkmap
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

