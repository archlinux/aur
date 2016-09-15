# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=docker-openrc-scripts-git
pkgver=1.13.0.dev.27256.b248de7
pkgrel=1
pkgdesc='Install the openrc startup script from the official openrc git repo'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache License Version 2.0')
options=('!strip')
source=(git+git://github.com/docker/docker
        'docker.install')
md5sums=('SKIP'
         'ab06126a6b29bee1dbfb4162c624b743')
install='docker.install'
depends=('openrc' 'docker')
makedepends=('git')
backup=('etc/conf.d/docker')
provides=('docker-openrc-scripts')
conflicts=('docker-openrc-git')
replaces=()


pkgver() {
	cd "${srcdir}/docker"
	_dockerver="$(cat VERSION)"
	printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd docker
	_dockerver="$(cat VERSION)"

	# OpenRC
	install -Dm755 "contrib/init/openrc/docker.confd" "$pkgdir/etc/conf.d/docker"
	install -Dm755 "contrib/init/openrc/docker.initd" "$pkgdir/etc/init.d/docker"

	# Fix to work with openrc on arch linux
	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
	-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
	-e 's|/var/run|/run|g' \
	-i ${pkgdir}/etc/init.d/docker


}

md5sums=('SKIP'
         '8237f8b8af3b5a088f5472455558e466')
md5sums=('SKIP'
         '81147c95b4a53a42031057a735dffe9d')
md5sums=('SKIP'
         '81147c95b4a53a42031057a735dffe9d')
md5sums=('SKIP'
         '81147c95b4a53a42031057a735dffe9d')
md5sums=('SKIP'
         '81147c95b4a53a42031057a735dffe9d')
