pkgname='ccemux-git'
pkgver=c13fed3650
pkgrel=1
source=('git+https://github.com/Lignumm/CCEmuX.git#branch=master'
        'ccemux.desktop'
        'ccemux'
        'icon.png')
md5sums=('SKIP'
         '3f3b4e6c756b4161e7618eb0be7ce031'
         '297fbda2e09c98bd37326a0ad59c612c'
         '15875de144d2375766e3cfb2c769c66e')
pkgdesc="Graphical ComputerCraft emulator"
arch=('any')
url="https://github.com/lignumm/ccemux"
license=('MIT')
depends=('java-environment>=8' 'bash')

pkgver() {
  cd "${srcdir}/CCEmuX"
  git show --oneline -s | cut -f 1 -d' '
}

build () {
  cd "${srcdir}/CCEmuX"
  chmod 0755 ./gradlew
  ./gradlew build
}

package () {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -dm755 "${pkgdir}/usr/share/pixmaps"

  cp ${srcdir}/CCEmuX/build/libs/CCEmuX*.jar "${pkgdir}/usr/share/ccemux.jar"
  cp "${srcdir}/ccemux.desktop" "${pkgdir}/usr/share/applications"
  cp "${srcdir}/ccemux" "${pkgdir}/usr/bin/"
  chmod 755 "${pkgdir}/usr/bin/ccemux"
  cp "${srcdir}/CCEmuX/LICENCE.txt" "${pkgdir}/usr/share/licenses/$pkgname"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/ccemux.png"
  ls
}
