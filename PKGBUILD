# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=hyprdown-git
_pkgname=hyprdown
pkgver=0.3.1_r1_gefbb663
pkgrel=1
pkgdesc='Close every app running under Hyprland without user input, then exit, power off, reboot or log out (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/hyprdown'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'json-c'
  'systemd'
  'systemd-libs'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cd "$_pkgname"
  make VERSION="$pkgver" dist/hyprdown
}

package() {
  cd "$_pkgname"
  make VERSION="$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
