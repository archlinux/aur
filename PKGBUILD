# Maintainer: Alex Seiler <seileralex at gmail dot com>
pkgname=backupper
pkgver=0.1.3
pkgrel=1
pkgdesc="A tool to perform full and incremental backups."
arch=('any')
url="https://github.com/goggle/backupper"
license=('MIT')
groups=()
depends=('python' 'tar')
optdepends=('gzip: gzip compression support'
            'bzip2: bzip2 compression support'
            'xz: xz compression support'
            'systemd: use systemd timer for incremental backups')
makedepends=()
provides=()
conflicts=()
replaces=()

backup=('etc/backupper.conf')
options=(!emptydirs)
install=
source=("https://github.com/goggle/backupper/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('23ef391acb6cdd2c1e08a8067ad61b3b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 timers/backupper-daily.service "$pkgdir/usr/lib/systemd/system/backupper-daily.service"
  install -Dm644 timers/backupper-daily.timer "$pkgdir/usr/lib/systemd/system/backupper-daily.timer"
}
