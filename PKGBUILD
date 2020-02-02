# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=jetbrains-jre
_major=11
_minor=0
_patch=6
_build=702.1
pkgver=${_major}.${_minor}.${_patch}b${_build}
pkgrel=2
pkgdesc="OpenJDK Java $_major runtime with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jdk"
license=('GPL2')
depends=('java-runtime-common' 'ca-certificates-java' 'java-environment-common')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-environment=$_major"
	"java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="jbr-${_major}_${_minor}_${_patch}-linux-x64-b${_build}.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jbr/${_zipname}")
sha256sums=('4eab7bdd141f1532f1db87155a7e2973c2743f631db9215f63c73a71ebce42b7')

package() {
	rm "$srcdir/$_zipname"
	find "$srcdir" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/usr/lib/jvm"
	cp -a "$srcdir/jbr" "$pkgdir/usr/lib/jvm/$pkgname"
	ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/lib/security/cacerts"
}
