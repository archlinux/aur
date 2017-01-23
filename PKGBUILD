# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=backup-git
_gitname=backup
pkgver=1.1
pkgrel=4
pkgdesc='A simple tar based incremental daily backup script based on systemd'
arch=('x86_64')
url=https://github.com/dhtseany/backup
license=('any')
makedepends=('git')
depends=('tar' 'pigz')
source=("git://github.com/dhtseany/${_gitname}.git")
md5sums=('SKIP')
install=backup-git.install
build() {
	cd "${srcdir}/${_gitname}"
	echo "Staging package"
	mkdir -p usr/bin/backup
	mkdir -p usr/share/backup
	mkdir -p etc/systemd/system
	mv backup.conf etc/backup.conf
	mv backup usr/bin/backup/backup
	mv backup.service etc/systemd/system/backup.service
	mv backup.timer etc/systemd/system/backup.timer
	mv storage-mounts-Public.mount usr/share/backup/storage-mounts-Public.mount.example
}

package() {
	cd "${srcdir}/${_gitname}"
	echo "Building package"
	cp -dr --no-preserve=ownership {usr,etc} "${pkgdir}"/
}
