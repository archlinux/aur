# Mantainer: Kevin Puertas <kevinpr at jkanetwork dot com>
# Contributor: St.kai <St.kai@live.cn>
# Contributor: ssysmso sending updated PKGBUILD
# Old Maintainer: Christoph Korn <christoph.korn at posteo dot de>
pkgname=beebeep
_pkgver=r1352
pkgver=5.8.2
pkgrel=2
pkgdesc="Secure LAN Messenger"
arch=('i686' 'x86_64')
url="https://www.beebeep.net/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'libxcb' 'avahi')
makedepends=('qt5-base' 'qt5-multimedia' 'libxcb' 'avahi')
 
source=("http://netcologne.dl.sourceforge.net/project/${pkgname}/Sources/${pkgname}-code-${pkgver}.zip"
        "${pkgname}.xpm"
        "${pkgname}.desktop"
        "${pkgname}_script")
md5sums=('b9f32711876c433f2434f9381fd66480'
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
  cp -a ${srcdir}/beebeep-code-${_pkgver}/test/lib*.so* ${pkgdir}/usr/lib/${pkgname}/
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a ${srcdir}/beebeep-code-${_pkgver}/locale/beebeep_*.qm ${pkgdir}/usr/share/${pkgname}/
  cp ${srcdir}/beebeep-code-${_pkgver}/misc/beep.wav ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
