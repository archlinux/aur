# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=screenstudio
pkgver=3.4.2
pkgrel=3
pkgdesc="Streaming software that lets you record your desktop in a full HD video files"
arch=('i686' 'x86_64')
depends=('beansbinding' 'java-runtime')
makedepends=('apache-ant' 'gendesk')
url="http://screenstudio.crombz.com/"
license=('GPL3')
source=(http://screenstudio.crombz.com/archives/ubuntu/ScreenStudio-Ubuntu-${pkgver}-src.tar.gz
        screenstudio.sh)
sha256sums=('42ba99dd3be99828b25efd9663519d3abf2f218835b1784086edcba38e950651'
            '5edd032089dcece9ffe6afa7c64e1116c78f45e872399d6a83d9f69db7bbdcd0')

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "ScreenStudio" --exec "screenstudio" --pkgdesc "ScreenStudio for Linux" --categories 'Video;AudioVideo;Recorder'
}

build() {
  cd "${srcdir}"
  ant clean
  ant -f . -Dnb.internal.action.name=build -Dlibs.beans-binding.classpath=/usr/share/java/beansbinding.jar jar
}

package() {
  cd "${srcdir}"
  install -Dm644 dist/ScreenStudio.jar "${pkgdir}/usr/share/java/screenstudio/ScreenStudio.jar"
  install -Dm644 libs/jkeymaster-1.1.jar "${pkgdir}/usr/share/java/screenstudio/jkeymaster-1.1.jar"
  install -Dm644 libs/Filters.jar "${pkgdir}/usr/share/java/screenstudio/Filters.jar"
  install -Dm644 libs/jna.jar "${pkgdir}/usr/share/java/screenstudio/jna.jar"
  install -Dm755 $srcdir/screenstudio.sh "${pkgdir}/usr/bin/screenstudio"
  install -Dm644 src/screenstudio/remote/logo.png "${pkgdir}/usr/share/pixmaps/ScreenStudio.png"
  install -Dm644 ScreenStudio.desktop "${pkgdir}/usr/share/applications/ScreenStudio.desktop"
}
