# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=restic-systemd-automatic-backup
pkgver=1.0.0
pkgrel=1
pkgdesc="Backup solution using restic/Backblaze B2 storage."
arch=('any') 
url="https://github.com/erikw/restic-systemd-automatic-backup"
license=('BSD' 'custom')
depends=('systemd' 'restic')
makedepends=('git')
source=("https://github.com/erikw/restic-systemd-automatic-backup/archive/v$pkgver.tar.gz")
sha256sums=('3efc6793954b232e497fb05db48aec0c174d64ccddda89432f253e6e74b66476')
backup=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"
  mv etc/restic/b2_env.sh.template etc/restic/b2_env.sh
  mv etc/restic/b2_pw.txt.template etc/restic/b2_pw.txt
  make PREFIX="$pkgdir" DEST_SCRIPTS="$pkgdir/usr/bin" DEST_SYSTEMD="$pkgdir/usr/lib/systemd/system" install 
  sed -e 's|/usr/local/sbin|/usr/bin|g' -i $pkgdir/usr/lib/systemd/system/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
