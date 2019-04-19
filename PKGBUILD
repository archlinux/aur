# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.9.2
pkgrel=1
pkgdesc="An AUR tool for managing an auto-updating local 'aurto' package repository using aurutils."
arch=('any')
url="https://github.com/alexheretic/aurto"
license=('MIT')
depends=('aurutils'
         'devtools'
         'systemd'
         'pacutils'
         'pacman-contrib'
         'curl'
         'sudo')
optdepends=()
makedepends=('cargo')
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b70ec2751201d5f4f7001545ce40cc64aac866a9e9333b0a1913083d5dfe3561')
backup=('usr/lib/systemd/system/check-aurto-git-trigger.timer'
        'usr/lib/systemd/system/update-aurto.timer'
        'etc/aurto/makepkg-chroot.conf')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
