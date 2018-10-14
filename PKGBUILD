pkgname='ccemux-git'
pkgver=532a5f0
pkgrel=1
source=('git+https://github.com/CCEmuX/CCEmuX.git#branch=revival'
        'ccemux.desktop'
        'ccemux'
        'icon.png')
md5sums=('SKIP'
         '3f3b4e6c756b4161e7618eb0be7ce031'
         '297fbda2e09c98bd37326a0ad59c612c'
         '15875de144d2375766e3cfb2c769c66e')
pkgdesc="Graphical ComputerCraft emulator"
arch=('any')
url="https://emux.cc"
license=('MIT')

depends=('java-runtime>=8')
makedepends=('java-environment>=8' 'java-openjfx>=8' 'bash')
optdepends=('java-openjfx>=8: javafx renderer support')

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

  # By default, we use the CC: Tweaked build since it's still actively maintained.
  # If you want vanilla CC, change "cct" to "cc" instead.
  cp ${srcdir}/CCEmuX/build/libs/CCEmuX*-cct.jar "${pkgdir}/usr/share/ccemux.jar"
  cp "${srcdir}/ccemux.desktop" "${pkgdir}/usr/share/applications"
  cp "${srcdir}/ccemux" "${pkgdir}/usr/bin/"
  chmod 755 "${pkgdir}/usr/bin/ccemux"
  cp "${srcdir}/CCEmuX/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/ccemux.png"
  ls
}
