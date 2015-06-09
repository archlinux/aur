# Maintainer: John Reese <john@noswap.com>
# Upstream URL: https://github.com/iBaa/PlexConnect
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=plexconnect-git
pkgver=20140218
pkgrel=2
pkgdesc="Integration layer between Apple TV and Plex"
arch=('any')
url="https://github.com/iBaa/PlexConnect"
license=('MIT')
depends=('python2' 'openssl')
makedepends=('git')
conflicts=('plexconnect')
install='plexconnect-git.install'

_gitroot="git://github.com/iBaa/PlexConnect"
_gitname="PlexConnect"

source=("$_gitroot"
        'plexconnect.service'
        'plexconnect-git.install')
sha1sums=('SKIP'
          '1ea92e7e4db97a04b8b2866941cfc0cfdadff8be'
          '86b1c6b71a0dd271a1e5ae073070c870ff73c07d')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  pkgpath="$pkgdir/opt/plexconnect"
  cd "$srcdir/$_gitname"

  mkdir -p "$pkgpath/"
  cp -r * "$pkgpath/"

  install -Dm644 "$srcdir/plexconnect.service" "$pkgdir/usr/lib/systemd/system/plexconnect.service"
}

# vim:set ts=2 sw=2 et:
