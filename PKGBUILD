# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=asmtools-hg
pkgver=r26.edbdc1bf3211
pkgrel=2
pkgdesc="The AsmTools open source project is used to develop tools for the production of proper and improper Java '.class' files."
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/asmtools"
license=('GPL2')
groups=()
depends=('java-runtime>=8')
makedepends=('mercurial' 'apache-ant' 'java-environment-openjdk=8')
optdepends=()
checkdepends=()
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
install=
source=('asmtools::hg+http://hg.openjdk.java.net/code-tools/asmtools')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-hg}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/${pkgname%-hg}/build"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant build
}

package() {
  cd $srcdir/${pkgname%-hg}-7.0-build/release
  install -D -m 644 lib/asmtools.jar ${pkgdir}/usr/share/java/${pkgname%-hg}/asmtools.jar
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
