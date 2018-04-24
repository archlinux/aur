# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=jtharness-hg
pkgver=r130.9e33ec101187
pkgrel=1
pkgdesc="general purpose, fully-featured, flexible, and configurable test harness very well suited for most types of unit testing"
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/JT+Harness"
license=('GPL2')
groups=()
depends=('java-runtime>=7')
makedepends=('mercurial' 'apache-ant' 'java-environment-openjdk=7' 'junit' 'java-asm')
optdepends=('junit')
checkdepends=()
install=
source=('jtharness::hg+http://hg.openjdk.java.net/code-tools/jtharness'
#        "${pkgname%-hg}.patch"
)
noextract=()
md5sums=('SKIP' 
#         'b20abde2a7d7920404044d62e732c454'
)

pkgver() {
  cd "$srcdir/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/${pkgname%-hg}"
#  patch -p1 -i "$srcdir/${pkgname%-hg}.patch"
}

build() {
  cd "$srcdir/${pkgname%-hg}/build"
  ln -sf /usr/share/java/junit.jar junit-4.10.jar
  ln -sf /usr/share/java/asm/asm.jar asm6.jar
  ln -sf /usr/share/java/asm/asm-commons.jar asm-commons6.jar
  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant
}

check() {
  cd "$srcdir/${pkgname%-hg}/build"
# test does not compile
#  JAVA_HOME=/usr/lib/jvm/java-7-openjdk ant test
}

package() {
  #mkdir -p $pkgdir/usr/share/{java/asm,licenses/$pkgname}
  cd $srcdir/JTHarness-build/binaries
  install -D -m 644 lib/javatest.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/javatest.jar
  install -D -m 644 lib/jtlite.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/jtlite.jar
  install -Dm644 legal/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
