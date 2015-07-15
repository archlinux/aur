# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=indimpc-git
pkgver=20121107
pkgrel=1
pkgdesc="Minimalistic MPD client with support for multimedia keys and notifications"
arch=("any")
url="https://github.com/fmoralesc/indimpc"
license=("custom")
depends=("python2-dbus" "python2-notify" "python2-mpd")

_gitroot="git://github.com/fmoralesc/indimpc.git"
_gitname="indimpc"

build() {
  cd "$srcdir"

  msg "Updating source code..."
  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm0755 "indimpc.py"      "$pkgdir/usr/bin/indimpc"
  install -Dm0644 "indimpc.desktop" "$pkgdir/etc/xdg/autostart/indimpc.desktop"
  install -Dm0644 "indimpc.rc" "$pkgdir/usr/share/doc/indimpc/indimpc.rc"
  install -Dm0644 "LICENSE"         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
