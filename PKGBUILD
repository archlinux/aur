# Maintainer: Daniel Souvignier <daniel.souvignier@gmail.com>
pkgname=docker-rpm-builder-git
pkgver=1.26.12
pkgrel=1
pkgdesc="A script to build rpms for different architectures using docker"
arch=('any')
url='https://github.com/alanfranz/docker-rpm-builder'
license=('Apache Public License 2.0')
depends=('docker')
makedepends=('python2-virtualenv')
provides=('docker-rpm-builder')
source=('docker-rpm-builder::git+https://github.com/alanfranz/docker-rpm-builder#branch=v1dev')
md5sums=('SKIP')

pkgver() {
	cd docker-rpm-builder
	git describe --long --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

build() {
	cd docker-rpm-builder
	make
}

package() {
	cd docker-rpm-builder
	mkdir -p $pkgdir/opt/docker-rpm-builder
	make PREFIX=$pkgdir/opt/docker-rpm-builder install
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/docker-rpm-builder/bin/docker-rpm-builder $pkgdir/usr/bin/docker-rpm-builder
	cd $pkgdir/opt/docker-rpm-builder/bin
	sed -i 's/\/tmp\/yaourt-tmp-daniel\/aur-docker-rpm-builder-git\/src\/docker-rpm-builder\/devenv/\/opt\/docker-rpm-builder/' activate activate.csh activate.fish bpdb bpython bpython-curses bpython-urwid docker-rpm-builder easy_install easy_install-2.7 pip pip2 pip2.7 pygmentize python-config unit2 wheel
}
