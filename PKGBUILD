# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=backup-git
_gitname=backup
pkgver=1.0
pkgrel=1
pkgdesc='A simple tar based incremental daily backup script based on systemd'
arch=('x86_64')
url=https://github.com/dhtseany/backup
license=('any')
makedepends=('git')
depends=('tar' 'pigz')
source=("git://github.com/dhtseany/${_gitname}.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_gitname}"
	echo "Staging package"
	mkdir -p etc/systemd/system
	mkdir -p 	opt/backup
	mv backup.sh opt/backup/backup.sh
	mv backup.service etc/systemd/system/backup.service
	mv backup.timer etc/systemd/system/backup.timer
	mv storage-mounts-Public.mount etc/systemd/system/storage-mounts-Public.mount

}

package() {
	cd "${srcdir}/${_gitname}"
	echo "Building package"
	cp -dr --no-preserve=ownership {etc,opt} "${pkgdir}"/
}
