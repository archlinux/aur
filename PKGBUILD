# Maintainer: Martynas Mickevičius <self@2m.lt>

pkgname=java-8-openjdk-shenandoah
_major=8
_build=219
pkgver=b${_build}
pkgrel=1
pkgdesc="OpenJDK Java 8 development kit with ultra-low pause time Shenandoah GC"
arch=('x86_64')
url="https://wiki.openjdk.java.net/display/shenandoah/Main"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
_zipname="openjdk-shenandoah-jdk${_major}-b${_build}-x86_64-release.tar.xz"
source=("https://builds.shipilev.net/openjdk-shenandoah-jdk8/${_zipname}")
sha256sums=('63bd82405b49f63d0ac9c859a640c689264a0576b5f95a63bc5e54a52c1f5763')

package() {
	rm "$srcdir/$_zipname"
	find "$srcdir" -exec chmod g+r,o+r {} +
	mkdir -p "$pkgdir/usr/lib/jvm"
	cp -a "$srcdir/j2sdk-image" "$pkgdir/usr/lib/jvm/$pkgname"
	ln -sf /etc/ssl/certs/java/cacerts "$pkgdir/usr/lib/jvm/$pkgname/jre/lib/security/cacerts"
}

