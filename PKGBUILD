# Maintainer: Felix M. Cobos <felix.cobos@gmail.com>

pkgname=intellij-jdk
_major=8
_minor=112
_build=783.1
pkgver=${_major}u${_minor}b${_build}
pkgrel=1
pkgdesc="OpenJDK Java 8 development kit with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://intellij-support.jetbrains.com/hc/en-us/articles/206544879-Selecting-the-JDK-version-the-IDE-will-run-under"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="jbsdk${pkgver}_linux_x64.tar.gz"
source=("https://dl.bintray.com/jetbrains/intellij-jdk/${_zipname}")
sha256sums=('8bd5a01c7310a6dd3c44407e707085125a546f22a94075dccb93634d8a47cbac')

package() {
	rm "$srcdir/$_zipname"
	find "$srcdir" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/usr/lib/jvm"
	cp -a "$srcdir" "$pkgdir/usr/lib/jvm/$pkgname"
	ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/jre/lib/security/cacerts"
}

