# Maintainer: Marco Scarpetta <marcoscarpetta02 at gmail dot com>

_gitcommit=4ea974775ed9ea1bb09396b08a39c4cb807009ca

pkgname=mt7601usta-odroid-c2
pkgver=r58.4ea9747
pkgrel=1
pkgdesc="MediaTek MT7601U chip driver for kernel version before 3.19"
arch=('aarch64')
url="https://github.com/art567/mt7601usta"
license=('GPL')
install=mt7601.install
depends=('linux>=3.0' 'linux<3.19')
makedepends=('git' 'linux-headers>=3.0')
source=("git+${url}.git#commit=${_gitcommit}")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/mt7601usta"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/mt7601usta/src"
   make
}

package() {
   cd "$srcdir/mt7601usta/src"

   install -Dm644 RT2870STA.dat "$pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat"
   install -Dm644 os/linux/mt7601Usta.ko "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/mt7601Usta.ko"
} 
