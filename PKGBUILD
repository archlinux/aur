# Maintainer: Dmitriy Geels <dmitry dot geels at gmail dot com>
pkgname=ubackup
pkgver=0.1.0
pkgrel=1
pkgdesc='Systemd timers for incremental tar backups and remote backup collection'
arch=('any')
url='https://github.com/dmig/ubackup'
license=('MIT')
depends=('bash' 'coreutils' 'openssh' 'rsync' 'systemd' 'tar' 'zstd')
backup=('etc/local-backup.conf')
source=(
  'local-backup.service'
  'local-backup.timer'
  'backup-pull@.service'
  'backup-pull@.timer'
  'local-backup.conf'
  'ubackup.tmpfiles'
  'README.md'
  'LICENSE'
)
sha256sums=(
  '43feb62aba77ce69974e487ae486bd5372ee3cc043bc0b3190a8135580342945'
  '7ee2fd745b9632d26f063139ba79d1bc4ff1a07e97bf43a80f251d166987aa84'
  '364429242e171211616e34908cc5ee90ee666f9c83027b766b441a51cca8bb36'
  'db1ebfe385df22191f2c7730ee40d7a39431c5bb0cdea9a116b33f60da14dc51'
  'a17d214adde698bbe2c7bdfc08516f3c7f1f7873f23f60120445798515d6c153'
  '2d53ca3f3abbad07377fc0483eb27cf19bb927e901ca50c41c4493cae8bcac1b'
  '93004a798e11048df84254a18a74a251f56ba4f057380fd79aa9b76a2d8c3416'
  '98c1e0fc3de17523d8ca8ba31f82b9a2adb643184305a7c65dae8a062ab7e430'
)

package() {
  cd "$srcdir"
  install -Dm644 local-backup.service local-backup.timer \
    backup-pull@.service backup-pull@.timer -t "$pkgdir/usr/lib/systemd/system"
  install -Dm640 local-backup.conf "$pkgdir/etc/local-backup.conf"
  install -Dm644 ubackup.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/ubackup.conf"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
