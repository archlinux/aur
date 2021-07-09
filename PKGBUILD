# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.10.8
pkgrel=1
pkgdesc="An AUR tool for managing an auto-updating local 'aurto' package repository using aurutils."
arch=('x86_64' 'aarch64' 'armv7h')
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
sha256sums=('c6ec30fe7336471948a6882433ec4f15388b934727cdc131e718c74635eea811')
backup=('usr/lib/systemd/system/check-aurto-git-trigger.timer'
        'usr/lib/systemd/system/update-aurto.timer'
        'usr/lib/systemd/system/update-aurto-startup.timer'
        'etc/aurto/pacman-chroot.conf'
        'etc/aurto/makepkg-chroot.conf')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
