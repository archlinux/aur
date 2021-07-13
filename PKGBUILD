# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jre-jetbrains
_major=11
_minor=0
_patch=11
_build=1504.12
pkgver=${_major}.${_minor}.${_patch}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://github.com/JetBrains/JetBrainsRuntime"
license=('GPL2')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
replaces=(jetbrains-jre)
conflicts=(jetbrains-jre)
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
    "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major" "jetbrains-jre")
_zipname="jbr_jcef-${_major}_${_minor}_${_patch}-linux-x64-b${_build}.tar.gz"
install=$pkgname.install
source=("https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
b2sums=('2578c95438891b5634a93a079924d1d98bfbf6ae79eba7ae2043d90ef182fef9d2d32577671f9a21c40f1e740385a3b6b1189db6cc74e9a3cc45204964b07f18')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
