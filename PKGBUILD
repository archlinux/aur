# Maintainer: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.07
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
url="http://${pkgname}.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('fltk' 'libjpeg-turbo')
source=("http://download.sourceforge.net/eureka-editor/Eureka/1.07/${pkgname}-${pkgver}-source.tar.gz")
md5sums=('b9f3048ee56e4e7dcaa8c2e1c5bc7076')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  sed 's/install: stripped/install:/g' -i Makefile
  sed '/xdg-/d' -i Makefile

  make PREFIX=/usr OPTIMISE="${CXXFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install

  install -D -m644 misc/eureka.ico "${pkgdir}/usr/share/pixmaps/eureka.ico"
  install -D -m644 misc/eureka.desktop "${pkgdir}/usr/share/applications/eureka.desktop"
  install -D -m644 misc/eureka.6 "${pkgdir}/usr/share/man/man6/eureka.6"
}

# vim:set ts=2 sw=2 et:
