# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=asmtools
_version=7.0
_build=b04
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
_tag=${_version}-${_build}
source=("http://hg.openjdk.java.net/code-tools/asmtools/archive/${_tag}.tar.gz")
sha256sums=('2c06cb94ee23428347643b096deb837d36f19c99dbd487354dd1bf82e22f92ec')

_asmtoolsdir=${pkgname}-${_tag}

build() {
  cd ${srcdir}/${_asmtoolsdir}/build
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant build
}

package() {
  cd $srcdir/${pkgname}-${_version}-build/release
  install -D -m 644 lib/asmtools.jar ${pkgdir}/usr/share/java/${pkgname}/asmtools.jar
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
