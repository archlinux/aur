# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=openrtm-aist-java
pkgver=1.0.0
pkgrel=1
pkgdesc="Java bindings for OpenRTM-aist"
arch=('i686' 'x86_64')
url="http://www.openrtm.org"
license=('GPL')
depends=('java-environment')
makedepends=('apache-ant')
source=(http://www.openrtm.org/pub/OpenRTM-aist/java/1.0.0/OpenRTM-aist-Java-${pkgver}-RELEASE.tar.gz
        http://www.openrtm.org/pub/OpenRTM-aist/java/1.0.0/OpenRTM-aist-Java-${pkgver}-jar.zip
        openrtm-aist.profile)
md5sums=('5a0fd25eb9ce87d72f0b377b3d24a43a'
         'b1c538b3baa390a895e90e033e6d0d87'
         'fca4ed195d35b56ac4172a1027f7eaf0')

build() {
	cd ${srcdir}/jp.go.aist.rtm.RTC
	
	ant buildAllLinux 
}

package() {
	cd ${srcdir}/jp.go.aist.rtm.RTC
	
	# install profile.d script
	install -Dm755 ${srcdir}/openrtm-aist.profile ${pkgdir}/etc/profile.d/openrtm-aist.sh
	
	# install jar files
	install -Dd -m755 ${pkgdir}/usr/share/java/openrtm-aist-java
	cp -r installer/resources/Source/* ${pkgdir}/usr/share/java/openrtm-aist-java
	cp lib/commons-cli-1.1.jar ${pkgdir}/usr/share/java/openrtm-aist-java/jar
	
	# install shell scripts to execute examples
	cd ${srcdir}/OpenRTM-aist/1.0/examples
	cp *.sh ${pkgdir}/usr/share/java/openrtm-aist-java/examples
}

