# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.11
_pkgver=111
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
url="http://eureka-editor.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('fltk' 'libjpeg-turbo')
source=("http://download.sourceforge.net/eureka-editor/Eureka/1.07/${pkgname}-${_pkgver}-source.tar.gz"
"eureka.install")
md5sums=('354f95f286a064ce405de9baacb9771d'
         '41026f5e9e4d3ba7559da2a8c9b26816')

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

  install -D -m644 misc/eureka.xpm "${pkgdir}/usr/share/pixmaps/eureka.xpm"
  install -D -m644 misc/eureka.desktop "${pkgdir}/usr/share/applications/eureka.desktop"
  install -D -m644 misc/eureka.6 "${pkgdir}/usr/share/man/man6/eureka.6"
}

# vim:set ts=2 sw=2 et:


