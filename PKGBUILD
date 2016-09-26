# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=check_pacman-git
pkgver=1.1.0.r0.g5f20592
pkgrel=1
pkgdesc="Nagios monitoring plugin for checking for available Pacman package updates"
arch=('i686' 'x86_64')
makedepends=('git' 'stack' 'ghc')
url="https://github.com/dmp1ce/check_pacman"
license=('custom:Unlicense')
options=('strip')
source=(git+https://github.com/dmp1ce/check_pacman.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/check_pacman"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/bin"
  stack --local-bin-path "$pkgdir/usr/bin" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
