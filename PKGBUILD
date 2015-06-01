# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=jre7-embedded
_major=7
_minor=75

epoch=1
pkgver="${_major}.u${_minor}"
pkgrel=1

pkgdesc="Java SE Embedded Runtime Environment $_major (alongside OpenJDK)"
arch=('i686' 'arm' 'armv6h' 'armv7h')
url="http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html"
license=('custom')
depends=('java-runtime-common' 'ca-certificates-java')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-runtime-embedded=$_major" "java-runtime-headless-embedded=$_major")
options=(!strip)
install='jre.install'

case "$CARCH" in
      i686) _branch='x86' ; md5sums=('5437d2c5657deb427fdc28d195410070') ;;
    armv?h) _branch='arm' ; md5sums=('cf95bd519b3035a4e8c7b4aaf3dfac39') ;;
       arm) _branch='arm5'; md5sums=('8fcb9d76bc8270e2bfa31a5896f5edb1') ;;
esac
source=("https://github.com/skydrome/ejre/archive/${_branch}.zip")

package() {
    cd "$srcdir/ejre-${_branch}/ejre1.${_major}.0_${_minor}"
    mkdir -p "$pkgdir"/usr/{share/licenses/java7-embedded,lib/jvm/java-7-embedded/jre}

    cp -r COPYRIGHT *.txt "$pkgdir/usr/share/licenses/java7-embedded/"
    cp -ra *              "$pkgdir/usr/lib/jvm/java-7-embedded/jre/"
}
