# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=mailnot-git
pkgver=20131026
pkgrel=1
pkgdesc="A Gmail notifier for GNOME 3"
arch=(any)
url="http://github.com/fmoralesc/utils"
license=('GPL')
groups=()
depends=('python2-gobject' 'python2-dateutil') 
makedepends=('git')
provides=('mailnot')

_gitroot=git://github.com/fmoralesc/utils.git
_gitname=mailnot

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 mailnot "$pkgdir/usr/bin/mailnot"
  install -Dm644 mailnot.desktop "$pkgdir/usr/share/applications/mailnot.desktop"
}

# vim:set ts=2 sw=2 et:
