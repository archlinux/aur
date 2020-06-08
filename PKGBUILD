# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contriubtor: Manuel Conzelmann <manolo89@online.de>

_pkgname=rtl8822bu
pkgname=$_pkgname-git
pkgver=r51.9438d45
pkgrel=1
pkgdesc="Driver for the Realtek 822bu chipset."
arch=("x86_64")
url="https://github.com/EntropicEffect/rtl8822bu"
license=('unknown')
depends=("dkms")
makedepends=('linux-headers' 'git' 'bc')
source=("git+https://github.com/EntropicEffect/rtl8822bu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make -j`cat /proc/cpuinfo |grep "processor"|wc -l`
}

package() {
  cd "$srcdir/$_pkgname"
  mv 88x2bu.ko $pkgname.ko
  install -m 755 -d $pkgdir/usr/lib/modules/$(uname -r)/
  install -p -m 644 $pkgname.ko $pkgdir/usr/lib/modules/$(uname -r)/
# depmod -b $pkgdir -a
}
