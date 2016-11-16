# Maintainer: Daniel Souvignier <daniel.souvignier@gmail.com>
pkgname=docker-rpm-builder
pkgver=1.32.0
pkgrel=1
pkgdesc="A script to build rpms for different architectures using docker"
arch=('any')
url='https://github.com/alanfranz/docker-rpm-builder'
license=('Apache Public License 2.0')
depends=('docker')
makedepends=('python2-virtualenv')
provides=('docker-rpm-builder')
source=('docker-rpm-builder::git+https://github.com/alanfranz/docker-rpm-builder#branch=v1')
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

build() {
	cd $pkgname
	virtualenv2 -p /usr/bin/python2 docker-rpm-builder
	docker-rpm-builder/bin/pip install .
	virtualenv2 --relocatable docker-rpm-builder
}

package() {
	cd $pkgname
	mkdir -p $pkgdir/opt/
	cp -r docker-rpm-builder/ $pkgdir/opt/
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/docker-rpm-builder/bin/docker-rpm-builder $pkgdir/usr/bin/docker-rpm-builder
}
