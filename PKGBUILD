# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jetbrains-jre8
_update=222
_build=1621.1
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
sha256sums=('2116a73448f69403887122fb66eaa038c2f86673ee87f5896e9bb7ab1d58b7c0')

package() {
	rm "$srcdir/$_zipname"
	find "$srcdir" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/usr/lib/jvm"
	cp -a "$srcdir/jre" "$pkgdir/usr/lib/jvm/$pkgname"
	ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
