# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=jtharness
_version=6.0
_build=b01
pkgver=${_version}_${_build}
pkgrel=2
pkgdesc="general purpose, fully-featured, flexible, and configurable test harness very well suited for most types of unit testing"
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/JT+Harness"
license=('GPL2')
groups=()
depends=('java-runtime>=7')
makedepends=('apache-ant' 'java-environment-openjdk=7' 'junit' 'java-asm')
optdepends=('junit')
checkdepends=()
provides=()
conflicts=()
install=
_tag=jt${_version}-${_build}
source=("http://hg.openjdk.java.net/code-tools/jtharness/archive/${_tag}.tar.gz"
#        "${pkgname}.patch"
)
sha256sums=('8b1957a57e9f49bcd081560251ef1a4c4be6414fb62b512802d48a4d99db23c4' 
#         'b20abde2a7d7920404044d62e732c454'
)
_jtdir=${pkgname}-jt${_version}-${_build}
prepare() {
  cd ${srcdir}/${_jtdir}
#  patch -p1 -i "${srcdir}/${pkgname}.patch"
}

build() {
  cd ${srcdir}/${_jtdir}
  ln -sf /usr/share/java/junit.jar build/junit-4.10.jar
  ln -sf /usr/share/java/asm/asm.jar build/asm6.jar
  ln -sf /usr/share/java/asm/asm-commons.jar build/asm-commons6.jar
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant -f build/build.xml
}

check() {
  cd ${srcdir}/${_jtdir}
# test does not compile
#  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant -f build/build.xml test
}

package() {
  cd ${srcdir}/JTHarness-build/binaries
  install -D -m 644 lib/javatest.jar ${pkgdir}/usr/share/java/${pkgname}/javatest.jar
  install -D -m 644 lib/jtlite.jar ${pkgdir}/usr/share/java/${pkgname}/jtlite.jar
  install -Dm644 legal/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir $pkgdir/usr/share/${pkgname}
  ln -sf /usr/share/java/${pkgname} $pkgdir/usr/share/${pkgname}/lib
}

# vim:set ts=2 sw=2 et:
