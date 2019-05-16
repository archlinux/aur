# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=list-all-systemd-timers-git
pkgver=r7.1aaccb5
pkgrel=1
pkgdesc="Prints all systemd timers to stdout"
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('git' 'stack')
url="https://github.com/dmp1ce/list-all-systemd-timers"
license=('custom:Unlicense')
options=('strip')
source=("${pkgname}::git+https://github.com/dmp1ce/list-all-systemd-timers.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Building
  cd "${pkgname}" || exit
  stack ghc list-all-systemd-timers.hs
}

package() {
  cd "${pkgname}" || exit

  # Installing license
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/list-all-systemd-timers-git"

  # Installing
  mkdir -p "$pkgdir/usr/bin"
  install -Dm 755 list-all-systemd-timers -t "$pkgdir/usr/bin"
}
