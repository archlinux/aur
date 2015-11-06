# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=mail2rem-git
pkgver=0.2
pkgrel=1
pkgdesc="A script that searches *.ics in your mail and puts events to your Remind calendar"
arch=('any')
url="https://github.com/esovetkin/mail2rem"
license=('BSD')
depends=('notmuch' 'gawk' 'sed' 'ical2rem' 'ripmime')
optdepends=('remind')
makedepends=('git')

md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/esovetkin/mail2rem
_gitname=mail2rem

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
  install -Dm755 mail2rem "$pkgdir/usr/bin/mail2rem"
}

# vim:set ts=2 sw=2 et:
