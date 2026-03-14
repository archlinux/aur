# Maintainer: Ben Smith (shmall03) <contact@bensmithmusic.art>

_pkgname=sonic-tte
pkgname=$_pkgname-git
pkgver=0.1.r20.g070dce1
pkgrel=2
pkgdesc="Animated terminal media screensaver using TerminalTextEffects"
arch=('any')
url="https://github.com/shmall03/sonic-tte"
license=('GPL3')
depends=('playerctl' 'figlet' 'python' 'python-terminaltexteffects' 'coreutils' 'sed' 'gawk' 'findutils')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Standard AUR format for git packages without tags:
  # {latest_version}.r{commit_count}.g{short_hash}
  printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  
  # Binaries
  install -Dm755 bin/sonic-tte "$pkgdir/usr/bin/sonic-tte"
  
  # Shared data (Centering script and Fonts)
  # center_text.py is installed to /usr/share/sonic-tte/ where the main script expects it
  install -Dm755 bin/center_text.py "$pkgdir/usr/share/$_pkgname/center_text.py"
  install -Dm644 share/fonts/Delta-Corps-Priest-1.flf "$pkgdir/usr/share/$_pkgname/fonts/Delta-Corps-Priest-1.flf"
  
  # Configuration examples
  install -Dm644 share/sonic-tte.conf.example "$pkgdir/usr/share/$_pkgname/sonic-tte.conf.example"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
