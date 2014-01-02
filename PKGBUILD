# Maintainer: Yaron de Leeuw <jdlmail@gmail.com>

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

pkgname=duplicity-backup-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Bash wrapper script for automated backups with duplicity supporting S3"
arch=('any')
url="https://github.com/zertrin/duplicity-backup"
license=('GPL3')
makedepends=('git')
depends=('duplicity')
optdepends=('gnupg: encryption support'
           's3cmd: for storing on Amazon S3'
           'mailx: for mail notifications')
source=("$pkgname"::git+https://github.com/zertrin/duplicity-backup.git)
md5sums=('SKIP')
backup=('etc/duplicity-backup.conf')

# find version according to 
# http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	install -D -m644 "$pkgname/duplicity-backup.conf.example" "$pkgdir/etc/duplicity-backup.conf"
	install -D -m755 "$pkgname/duplicity-backup.sh" "$pkgdir/usr/bin/duplicity-backup"
}
