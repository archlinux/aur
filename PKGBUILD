# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=asmtools
_version=7.0
_build=b06
pkgver=${_version}_${_build}
pkgrel=1
pkgdesc="The AsmTools open source project is used to develop tools for the production of proper and improper Java '.class' files."
arch=('any')
url="https://wiki.openjdk.java.net/display/CodeTools/asmtools"
license=('GPL2')
groups=()
depends=('java-runtime>=8')
makedepends=('mercurial' 'apache-ant' 'java-environment-openjdk=8')
optdepends=()
checkdepends=()
provides=()
conflicts=()
install=
_tag=b95278aa8bf4
source=("http://hg.openjdk.java.net/code-tools/asmtools/archive/${_tag}.tar.gz")
sha256sums=('ec80d9c7aebfed2d15deb2fa8b484c55515bdd9e462bab5bc98c45c9f0096fff')

prepare() {
  cd ${srcdir}/${pkgname}-${_tag}
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant -f build/build.xml clean
}

build() {
  cd ${srcdir}/${pkgname}-${_tag}
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant -f build/build.xml
}

package() {
  cd ${srcdir}/${pkgname}-${_version}-build/release
  install -D -m 644 lib/asmtools.jar ${pkgdir}/usr/share/java/${pkgname}/asmtools.jar
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

