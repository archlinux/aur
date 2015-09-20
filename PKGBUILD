# Maintainer: Cyker Way <cykerway at gmail dot com>

_gitname=mt7601
pkgname=$_gitname-git
pkgver=2015.02.18
pkgrel=1
pkgdesc="Old MediaTek MT7601U chip driver for kernel version before 3.19"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/porjo/$_gitname"
license=('GPL')
install=mt7601.install
depends=('linux>=3.0' 'linux<3.19')
makedepends=('git' 'linux-headers>=3.0')
options=(!strip)
source=("git+${url}.git")

md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
   cd "$srcdir/$_gitname/src"
   make
}

package() {
   cd "$srcdir/$_gitname/src"

   install -Dm644 RT2870STA.dat "$pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat"
   install -Dm644 os/linux/mt7601Usta.ko "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/mt7601Usta.ko"
   depmod -a $(uname -r)
}
