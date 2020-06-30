# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jetbrains-jre8
_update=252
_build=1649.2
pkgver=8u${_update}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java 8 runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jdk"
license=('GPL2')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
provides=("java-runtime=8" "java-runtime-headless=8" "java-environment=8"
    "java-runtime-openjdk=8" "java-runtime-headless-jre=8" "java-environment-openjdk=8")
_zipname="jbrx-8u${_update}-linux-x64-b${_build}.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jbr/${_zipname}")
sha256sums=('167305714f2e101044a19a09474029377a181cc94d152354b3ed7251111fcf1d')

package() {
    rm "$srcdir/$_zipname"
    find "$srcdir" -exec chmod g+r,o+r {} +
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "$srcdir/jre" "$pkgdir/usr/lib/jvm/$pkgname"
    ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
