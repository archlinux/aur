# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.14.6
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
         'less'
         'sudo'
         'zstd'
         'ninja'
         'expect')
optdepends=()
makedepends=('cargo')
install="aurto.install"
# ring doesn't build with lto enabled: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e1639adcb45aea96e631e24742528d6654b4c052750bd3ee5a2ea6e06a075c14')
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
