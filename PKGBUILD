# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.10.2
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
         'less'
         'sudo')
optdepends=()
makedepends=('cargo')
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2f2dbc95d0e64d76a1f18e3579dff1f7a5d069553169e84a284b9e63e92ee67c')
backup=('usr/lib/systemd/system/check-aurto-git-trigger.timer'
        'usr/lib/systemd/system/update-aurto.timer'
        'usr/lib/systemd/system/update-aurto-startup.timer'
        'etc/aurto/makepkg-chroot.conf')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
