# Mantainer: <mclenin.at.gmail.com>

pkgname=airstream
pkgver=5.4.4
pkgrel=1
pkgdesc="Computer side of the AirStream software for Android streaming"
arch=('any')
url="http://airstream.io/"
license=('Commercial')
depends=('java-runtime' 'ffmpeg')
source=(http://54.212.250.206/pc-suites/airstream-linux.deb)
sha512sums=('e7bb9a367dfd617202d38a3d9da52e6dfd734f968764033138ae554506107b85c76730bc45404c5fec8ae7497a2e4950e4457a978e02b3e37bf9a4544c78b577')

package() {
  cd ${srcdir}
  tar -xJf data.tar.xz
  cd usr/lib/airstream
  install -Dm755 airstream.jar ${pkgdir}/usr/share/java/${pkgname}/airstream.jar
  install -Dm755 Indexer.jar ${pkgdir}/usr/share/java/${pkgname}/Indexer.jar
  install -Dm755 AirstreamVideoIndexer.jar ${pkgdir}/usr/share/java/${pkgname}/AirstreamVideoIndexer.jar

  cd ${srcdir}/usr/bin
  sed -i 's:lib:share/java:' ${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  cd ${srcdir}/usr/share/applications
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  cd ${srcdir}/usr/share/${pkgname}
  install -Dm644 app.png ${pkgdir}/usr/share/pixmaps/airstream.png
  
}
