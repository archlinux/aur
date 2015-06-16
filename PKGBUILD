# Maintainer: Daniel Escoz <darkhogg+aur@gmail.com>
_gitname=idle_master_py
pkgname=steam-idle-master-git
epoch=1
pkgver=r3.8b2015e
pkgrel=1
pkgdesc="Get your Steam Trading Cards the Easy Way"
arch=(any)
url="https://github.com/jshackles/idle_master_py"
license=('GPL')
depends=(python2-beautifulsoup4 python2-requests python2-pillow python2-colorama tk)
makedepends=('git')
source=(
  $_gitname::git+https://github.com/jshackles/idle_master_py.git
  steam-idle
)
backup=(usr/lib/steam-idle-master/settings.txt)
md5sums=('SKIP'
         '43b8d7e347b72939b4aa6a6b0a90132f')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/lib/steam-idle-master"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/steam-idle-master"

  install -m0755 "$srcdir/steam-idle" "$pkgdir/usr/bin/steam-idle"

  #install -m0644 "$srcdir/$_gitname/Python (non-Windows)/Linux/settings.txt" "$pkgdir/usr/lib/steam-idle-master/settings.txt"
  ln -s /usr/lib/steam-idle-master/settings.txt "$pkgdir/etc/steam-idle-master/"

  cd "$srcdir/$_gitname/Releases/Linux"
  for f in *; do
    install -m0644 "$f" "$pkgdir/usr/lib/steam-idle-master/"
  done

  touch "$pkgdir/usr/lib/steam-idle-master/idlemaster.log"
  chmod a+rw "$pkgdir/usr/lib/steam-idle-master/idlemaster.log"
}

# vim:set ts=2 sw=2 et:
