# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mkinitcpio-lvm2c
pkgver=2.02.181
pkgrel=1
pkgdesc='Provide lvm2 hook compatible with older kernels'
arch=('any')
url='https://aur.archlinux.org/packages/mkinitcpio-lvm2c'
depends=('lvm2' 'mkinitcpio')
license=('GPL')
install=$pkgname.install
source=(lvm2c.patch)
md5sums=('859531ebdfb19d080f7045d815820aed')

pkgver() {
  pacman -Qi lvm2|awk '/^Version/{print$3}'|sed 's,-.*,,'
}

build() {
  mkdir -p $pkgname
  cd $pkgname
  cp /usr/lib/initcpio/hooks/lvm2 lvm2c_hook
  cp /usr/lib/initcpio/install/lvm2 lvm2c_install
  cp /usr/lib/initcpio/install/sd-lvm2 sd-lvm2c_install
  patch -Np1 -b -z .orig <../lvm2c.patch
}

package() {
  cd $pkgname
  install -Dm0644 lvm2c_hook "$pkgdir/usr/lib/initcpio/hooks/lvm2c"
  install -Dm0644 lvm2c_install "$pkgdir/usr/lib/initcpio/install/lvm2c"
  install -Dm0644 sd-lvm2c_install "$pkgdir/usr/lib/initcpio/install/sd-lvm2c"
}
md5sums=('eedfb1ed11ead32323bf18838245663d')
md5sums=('945b7683359f4981a8ee1ff8a1304e90')
