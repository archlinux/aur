# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=seclists
pkgname="$_name-git"
pkgver=2026.1.r6641.g21a949d
pkgrel=1
pkgdesc="Collection of multiple types of lists used during security assessments"
arch=('any')
url="https://github.com/danielmiessler/$_name"
license=('MIT')
provides=("$_name")
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
  _tag="$(git tag | sort -V | tail -1)"
  printf '%s.r%s.g%s' "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_name"
  mkdir -p "$pkgdir/usr/share/$_name"
  for dir in Ai Discovery Fuzzing Miscellaneous Passwords Pattern-Matching Payloads Usernames Web-Shells; do
    cp -ar $dir "$pkgdir/usr/share/$_name"
  done
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
