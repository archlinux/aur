# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=seclists
pkgname="$_name-git"
pkgver=2026.1.r300.g7b0b0b855
pkgrel=1
pkgdesc="Collection of multiple types of lists used during security assessments"
arch=('any')
url="https://github.com/danielmiessler/$_name"
license=('MIT')
provides=("$_name=$pkgver")
conflicts=("$_name")
options=(!debug)
depends=(
  'bash'
  'python'
  'perl'
)
makedepends=(
  'git'
)
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_name"
  mkdir -p "$pkgdir/usr/share/$_name"
  for _dir in Ai Discovery Fuzzing Miscellaneous Passwords Pattern-Matching Payloads Usernames Web-Shells; do
    cp -ar "$_dir" "$pkgdir/usr/share/$_name"
  done
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
