# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jetbrains-jre
_major=11
_minor=0
_patch=7
_build=956.18
pkgver=${_major}.${_minor}.${_patch}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jdk"
license=('GPL2')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
    "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="jbr-${_major}_${_minor}_${_patch}-linux-x64-b${_build}.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jbr/${_zipname}")
sha256sums=('73f467ae84d7e791b2afac2773a309365ee23df0509e109c7eb1820c2eee9cc8')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
