# Maintainer: Ben Smith (shmall03) <contact@bensmithmusic.art>

_pkgname=sonic-tte
pkgname=$_pkgname-git
pkgver=0.1.r0.g0000000
pkgrel=2
pkgdesc="Animated terminal media screensaver using TerminalTextEffects"
arch=('any')
url="https://github.com/shmall03/sonic-tte"
license=('GPL3')
depends=('playerctl' 'figlet' 'python-terminaltexteffects')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Most robust way: get count and hash separately. 
  # No pipes, no sed, no tags required.
  local _count=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short HEAD)
  printf "0.1.r%s.g%s" "$_count" "$_hash"
}

package() {
  cd "$_pkgname"
  install -Dm755 bin/sonic-tte "$pkgdir/usr/bin/sonic-tte"
  install -Dm755 bin/center_text.py "$pkgdir/usr/share/$_pkgname/center_text.py"
  install -Dm644 share/fonts/Delta-Corps-Priest-1.flf "$pkgdir/usr/share/$_pkgname/fonts/Delta-Corps-Priest-1.flf"
  install -Dm644 share/sonic-tte.conf.example "$pkgdir/usr/share/$_pkgname/sonic-tte.conf.example"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
