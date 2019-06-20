# Mantainer: Kevin Puertas <kevinpr at jkanetwork dot com>
# Thanks to ssysmso for the updated PKGBUILD
# Old Maintainer: Christoph Korn <christoph.korn at posteo dot de>
pkgname=beebeep
_pkgver=r1121
pkgver=5.6.2
pkgrel=1
pkgdesc="Secure LAN Messenger"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/beebeep/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'libxcb' 'avahi')
makedepends=('qt5-base' 'qt5-multimedia' 'libxcb' 'avahi')
 
source=("http://netcologne.dl.sourceforge.net/project/${pkgname}/Sources/${pkgname}-code-${pkgver}.zip"
        "${pkgname}.xpm"
        "${pkgname}.desktop"
        "${pkgname}_script")
md5sums=('4f3c435810119238610ceaa19acc14b7'
         '08e15ed0d7e938c863e5437984e9c597'
         'e89c5abe353abcbbbb2b9ae9be3e46bc'
         'a282005b0f8ee2dffc42704612ad95fe')
 
prepare() {
  cd beebeep-code-${_pkgver}
}
 
build() {
  cd beebeep-code-${_pkgver}
  cd src && qmake-qt5
  cd ../plugins && qmake-qt5
  cd .. && qmake-qt5
  make
}
 
package(){
  install -Dm755 "${srcdir}/beebeep-code-${_pkgver}/test/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -a ${srcdir}/beebeep-code-${_pkgver}/test/lib*.so.* ${pkgdir}/usr/lib/${pkgname}/
 
  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
