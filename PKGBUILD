#Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
#Maintainer: Heiko Nickerl <devATheiko-nickerlDOTcom>
_name="Jive"
pkgname=${_name,,}
pkgver=7.38
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A standalone JAVA application designed to browse and edit the static TANGO database"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' sh)
source=(
  https://repo1.maven.org/maven2/org/tango-controls/${_name}/${pkgver}/${_jarfile}
  launcher
)
sha256sums=(
  '891767c2051412966e7f700c218f911ab8a832bee6138418e48265fa8bbd25c3'
  'be94be7e0794c84c6011ebda88adfc1dfce911beaa8aec55f66b4b226ee4b6d7'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
