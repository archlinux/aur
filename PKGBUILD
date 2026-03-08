# Maintainer: Ben Smith (shmall03) <contact@bensmithmusic.art>

_pkgname=sonic-tte
pkgname=$_pkgname-git
pkgver=0.1.r0.g0000000
pkgrel=1
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

  # 1. Explicitly check if git-describe works
  if git describe --long --tags >/dev/null 2>&1; then
    # It worked! Now we can safely pipe it to sed.
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    # It failed! Now we provide the absolute fallback.
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "$_pkgname"
  install -Dm755 bin/sonic-tte "$pkgdir/usr/bin/sonic-tte"
  install -Dm755 bin/center_text.py "$pkgdir/usr/share/$_pkgname/center_text.py"
  install -Dm644 share/fonts/Delta-Corps-Priest-1.flf "$pkgdir/usr/share/$_pkgname/fonts/Delta-Corps-Priest-1.flf"
  install -Dm644 share/sonic-tte.conf.example "$pkgdir/usr/share/$_pkgname/sonic-tte.conf.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
