# Maintainer: Milo Mirate <mmirate@gmx.com>
pkgname=pipe2imap-git
pkgver=20120529
pkgrel=1
pkgdesc="Appends a message from stdin to an IMAP mailbox."
arch=('any')
url="https://github.com/mikecardwell/pipe2imap"
license=('GPL')
groups=()
depends=('perl-imap-client')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/mikecardwell/pipe2imap.git"
_gitname="pipe2imap"

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

  #
  # NO BUILD HERE, IT'S JUST A PERL SCRIPT
  #
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 pipe2imap.pl "$pkgdir/usr/bin/pipe2imap.pl"
}

# vim:set ts=2 sw=2 et:
