# Maintainer: Todd E Johnson <todd@toddejohnson.net>
# Maintainer: Erik Westrup <erik.westrup@gmail.com>

pkgname=restic-systemd-automatic-backup
pkgver=1.0.1
pkgrel=1
pkgdesc="Backup solution using restic with Backblaze B2 storage backend."
arch=('any')
url="https://github.com/erikw/restic-systemd-automatic-backup"
license=('BSD' 'custom')
depends=('systemd' 'restic')
source=("https://github.com/erikw/restic-systemd-automatic-backup/archive/v$pkgver.tar.gz")
sha256sums=('10f8b99c70e7ae8abdb2670edd323f11d7fe8f1b5ecafaa7e0d3c01b1658e290')
backup=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir" DEST_SCRIPTS="$pkgdir/usr/bin" DEST_SYSTEMD="$pkgdir/usr/lib/systemd/system" install
  sed -e 's|/usr/local/sbin|/usr/bin|g' -i $pkgdir/usr/lib/systemd/system/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
