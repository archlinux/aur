# Maintainer: Todd E Johnson <todd@toddejohnson.net>
# Maintainer: Erik Westrup <erik.westrup@gmail.com>

pkgname=restic-systemd-automatic-backup
pkgver=3.0.2
pkgrel=1
pkgdesc="Automatic backups using restic + systemd timers with Backblaze B2 storage backend."
arch=('any')
url="https://github.com/erikw/$pkgname"
license=('BSD' 'custom')
depends=('systemd' 'restic')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erikw/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0f88d126b56ec1d9bed0930ca351e960ded4d94cebdad85153f57aec0df650d5')
backup=('etc/restic/backup_exclude.txt' 'etc/restic/default.env' 'etc/restic/_global.env' 'etc/restic/pw.txt')
# Backup <3.0.0 conf files for whose who upgrade.
backup+=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir" DEST_SCRIPTS="$pkgdir/usr/bin" DEST_SYSTEMD="$pkgdir/usr/lib/systemd/system" install
  sed -e 's|/usr/local/sbin|/usr/bin|g' -i $pkgdir/usr/lib/systemd/system/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
