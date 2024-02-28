# Maintainer: Leorize <alaviss0 plus aur at gmail dot com>

pkgname=xkeyboard-config-dreymar-git
_pkgname=bbkt
pkgver=r60.51e0778
pkgrel=1
pkgdesc="DreymaR's Extensive Yet Modular ARSenal (for X KeyBoarding)"
arch=(any)
url="https://forum.colemak.com/topic/1438-dreymars-big-bag-of-keyboard-tricks-linuxxkb-files-included"
license=('unknown')
optdepends=('xorg-setxkbmap')
source=("bbkt::git+https://github.com/DreymaR/BigBagKbdTrix_XKB.git"
        "ignore-benign-warning.patch")
sha256sums=("SKIP"
            "99abcadb49c5e3c194c5e7fbfb9d7c62e0c9dc2dec84ecffdfd98ad1232cd36f")
provides=('bigbagkbdtrixxkb-git')
conflicts=('bigbagkbdtrixxkb-git')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/ignore-benign-warning.patch"
}

package() {
  cd "$_pkgname"
  bash ./install-dreymar-xmod.sh -i "$pkgdir/usr/share/X11" -n
  install -dm755 "$pkgdir/usr/bin"
  mv "$pkgdir/usr/share/X11/setkb.sh" "$pkgdir/usr/bin/setkb.sh"
  chmod 755 "$pkgdir/usr/bin/setkb.sh"
}

