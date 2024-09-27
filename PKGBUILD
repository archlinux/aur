# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.14.0
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
         'ninja')
optdepends=()
makedepends=('cargo')
install="aurto.install"
# ring doesn't build with lto enabled: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b27ceea3341c709136dfcd860303dcba0b7d4277a104527256619a3e46a00b88')
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
