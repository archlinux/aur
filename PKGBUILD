# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>

pkgname=intellij-jdk
_major=8
_minor=202
_build=1514.2
pkgver=${_major}u${_minor}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java 8 development kit with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jdk"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="jbrsdk-${_major}u${_minor}-linux-x64-b${_build}.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jdk/${_zipname}")
sha256sums=('df56f917335cea3801f218f31788641445d67ff867ecf273a5a5e10da185ada0')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/jre/lib/security/cacerts"
}
