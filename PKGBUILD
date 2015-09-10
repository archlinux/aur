pkgname=touchpad-state-git
_pkgname=${pkgname%-*}
pkgver=0.89.1
pkgrel=1
pkgdesc="Set touchpad state; includes udev on-mouse rule."
arch=("any")
url="https://github.com/Gen2ly/"$_pkgname"/"
license=("GPL2")
depends=("xf86-input-synaptics")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/Gen2ly/"$_pkgname"")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname  "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 01-"$_pkgname"-onmouse.rules \
    "$pkgdir"/usr/lib/udev/rules.d/01-"$_pkgname"-onmouse.rules
  install -Dm644 license.txt \
    "$pkgdir"/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
