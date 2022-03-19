# Maintainer: Fox Kiester <noct[at]posteo[dot]net>

_pkgname=tdrop
pkgname=tdrop-git
pkgver=0.4.0.r6.gca08ab9
pkgrel=1
pkgdesc="A WM-Independent dropdown window and terminal creator"
arch=('any')
url="https://github.com/noctuid/tdrop"
license=('Simplified BSD')
depends=('bash' 'coreutils' 'gawk' 'procps-ng' 'xdotool' 'xorg-xwininfo'
         'xorg-xprop')
optdepends=(
  # keybinding support
  'sxhkd'
  # session starting support
  'tmux'
  'tmuxinator'
  'tmuxp'
  # multiple monitor support
  'xorg-xrandr'
)
makedepends=('git')
provides=("${_pkgname}")
md5sums=('SKIP')
source=("git+https://github.com/noctuid/${_pkgname}")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
