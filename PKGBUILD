# Maintainer: Leorize <alaviss0 plus aur at gmail dot com>

pkgname=xkeyboard-config-dreymar-git
_pkgname=bbkt
pkgver=r3.9d3de38
pkgrel=1
pkgdesc="DreymaR's Extensive Yet Modular ARSenal (for X KeyBoarding)"
arch=(any)
url="https://forum.colemak.com/topic/1438-dreymars-big-bag-of-keyboard-tricks-linuxxkb-files-included"
license=('unknown')
provides=('xkbdata' 'xkeyboard-config')
conflicts=('xkbdata' 'xkeyboard-config')
makedepends=('git')
source=("bbkt::git+https://github.com/DreymaR/BigBagKbdTrix_XKB.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  bash ./install-dreymar-xmod.sh -i "$pkgdir/usr/share/X11" -n
  mv "$pkgdir/usr/share/X11/"{d,}xkb
  install -dm755 "$pkgdir/usr/bin"
  mv "$pkgdir/usr/share/X11/setxkb.sh" "$pkgdir/usr/bin/setxkb.sh"
  chmod 755 "$pkgdir/usr/bin/setxkb.sh"
}
