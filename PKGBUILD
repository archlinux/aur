# Maintainer: 윤병익 <by_yeun@daum.net>

pkgname=zulu-jdk
_major=8
_minor=144
_build=01
_zulu_build=8.23.0.3
pkgver=${_major}u${_minor}b${_build}
pkgrel=1
pkgdesc="Zulu JVM built upon OpenJDK 8"
arch=('x86_64')
url="http://zulu.org/"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_tarballname="zulu${_zulu_build}-jdk${_major}.0.${_minor}-linux_x64"
source=("http://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")

package() {
	rm "$srcdir/${_tarballname}.tar.gz"
	find "$srcdir/${_tarballname}" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/usr/lib/jvm"
	cp -a "$srcdir/${_tarballname}" "$pkgdir/usr/lib/jvm/$pkgname"
	ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/jre/lib/security/cacerts"
}

md5sums=('6ecd67688407b9f7e45c2736f003398b')
sha512sums=('9ddbf47569494b3a2a6bba229e4a090b01b706389adb376a6470838a53e2266febbfb2a9ebc720873ce3c9b190b3bd9b8ac4ac45c124b527fea1b31b5c06d701')
