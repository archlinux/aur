# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jre-jetbrains
_major=11
_minor=0
_patch=11
_build=1504.16
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
b2sums=('0e5e350bbb249016abf8a12f13044be79ea7561c204c7f89c78f67732d3121a8df4b3c740948b3ef7a9afcf8f7d5090b774a12408cd6c85c51963ea3f9abc20e')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jbr" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
