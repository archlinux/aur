# Maintainer: Luke Chen Shui <chenshuiluke@gmail.com>
pkgname=portmapper-git
pkgver=204
pkgrel=1
_pkgname=portmapper
epoch=
pkgdesc="The UPnP PortMapper can be used to easily manage the port mappings/port forwarding of a UPnP enabled internet gateway/router in the local network."
arch=('i686' 'x86_64')
url="https://github.com/kaklakariada/portmapper"
depends=('jdk8-openjdk' 'jre8-openjdk')
source=("git+https://github.com/kaklakariada/portmapper.git")
md5sums=('SKIP')
pkgver() {
  cd ${_pkgname}
  git rev-list --count HEAD
}
build(){
	cd "${_pkgname}"
	./gradlew build
}
package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/applications/
	cp ../portmapper.sh $pkgdir/usr/bin/portmapper
	cp $srcdir/portmapper/build/libs/portmapper-*.jar $pkgdir/usr/bin
	cp ../portmapper.desktop $pkgdir/usr/share/applications/portmapper.desktop
	chmod a+x $pkgdir/usr/bin/portmapper
}

