# Maintainer: Runnytu < runnytu at gmail dot com >
 
_gitname=mt7601u
pkgname=$_gitname-git
pkgver=2015.06.29
_extramodules=extramodules-4.1-ARCH
pkgrel=1
pkgdesc="Driver for Mediatek MT7601U USB bgn WiFi dongle"
arch=('i686' 'x86_64')
url="https://github.com/kuba-moo/$_gitname"
license=('GPL')
depends=('linux>=4.1' 'linux<4.2')
makedepends=('git' 'linux-headers>=4.1' 'linux-headers<4.2')
install=${_gitname}.install
options=(!strip)
source=("git+${url}.git" "http://www.mediatek.com/AmazonS3/Downloads/linux/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2")
               
md5sums=('SKIP' '5f440dccc8bc952745a191994fc34699')

pkgver() {
   cd "$srcdir/$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
   cd "$srcdir/$_gitname"

   make
}

package() {
   cd "$srcdir/$_gitname"

   install -Dm644 $_gitname.ko \
      "$pkgdir/usr/lib/modules/${_extramodules}/$_gitname.ko"
   gzip "$pkgdir/usr/lib/modules/${_extramodules}/"$_gitname.ko
   install -Dm644 "$srcdir/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/mcu/bin/MT7601.bin" "$pkgdir/usr/lib/firmware/$_gitname.bin"
}
