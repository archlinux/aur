# Maintainer: Sebastian Wilzbach <sebi at wilzbach dot me>
pkgname=backup-luks
pkgrel=1
pkgver=v5
pkgdesc="Convenient wrapper for running encrypted backups with rsync"
arch=('any')
url="https://github.com/greenify/backup-luks"
license=('GPL3')
groups=()
depends=('python' 'gdisk' 'bash' 'sh' 'python-gobject')
makedepends=('git')
optdepends=('cronic')
source=('git+https://github.com/greenify/backup-luks.git')
provides=('backup-luks')

package() {
  cd $pkgname

  # binaries
  mkdir -p $pkgdir/usr/bin/
  cp backup-luks $pkgdir/usr/bin
  cp create_disk $pkgdir/usr/bin
  cp create_partition $pkgdir/usr/bin

  # shared
  mkdir -p $pkgdir/usr/share/backup-luks
  cp backup-example $pkgdir/usr/share/backup-luks
  cp README.md $pkgdir/usr/share/backup-luks

  # replace script dir
  sed -e 's/DIR="\$.*/DIR=\/usr\/bin\/backup-luks/' -i $pkgdir/usr/share/backup-luks/backup-example

  msg2 ""
  msg2 "You can find an example script under /usr/share/$pkgname/backup-example"
  msg2 ""
}

pkgver() {
  cd $pkgname
  echo "v"$(git rev-list --count master)
}

md5sums=('SKIP')

# vim:set ts=2 sw=2 et:
