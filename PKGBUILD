# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=restic-systemd-automatic-backup
pkgver=0.1.0
pkgrel=1
pkgdesc="Backup solution using restic/Backblaze B2 storage."
arch=('any') 
url="https://github.com/erikw/restic-systemd-automatic-backup"
license=('BSD' 'custom')
depends=('systemd' 'restic')
makedepends=('git')
source=("https://github.com/erikw/restic-systemd-automatic-backup/archive/v$pkgver.tar.gz")
sha256sums=('1efb1e1c9c1ef8b312f2c3c76a9176b37182dc88ef99357c1a14715e64f63798')
backup=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir" DEST_SCRIPTS="$pkgdir/usr/bin" DEST_SYSTEMD="$pkgdir/usr/lib/systemd/system" install 
  sed -e 's|/usr/local/sbin|/usr/bin|g' -i $pkgdir/usr/lib/systemd/system/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
