pkgname='ccemux-git'
pkgver=60df535077
pkgrel=1
source=('git+https://github.com/Lignumm/CCEmuX.git#branch=rewrite'
        'ccemux.desktop'
        'ccemux'
        'icon.png')
md5sums=('SKIP'
         '6fdd1246516d89d1b469f90fbbd99b8a'
         'a8ecb0af11a9ab8be89db83325d4e6d5'
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
