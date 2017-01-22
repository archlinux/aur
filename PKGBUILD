# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=backup-git
_gitname=backup
pkgver=1.0
pkgrel=2
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
	mv backup.sh usr/bin/backup/backup
	mv backup.service usr/share/backup/backup.service.example
	mv backup.timer usr/share/backup/backup.timer.example
	mv storage-mounts-Public.mount usr/share/backup/storage-mounts-Public.mount.example
}

package() {
	cd "${srcdir}/${_gitname}"
	echo "Building package"
	cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
