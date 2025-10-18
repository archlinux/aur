# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='logparse'
pkgname="$_pkgname-git"
pkgver=r7.g01578e4
pkgrel=1
pkgdesc="Shell script that parses Caddy's JSON log files and outputs them as formatted text (development version)"
arch=('any')
url='https://git.tnonline.net/Forza/logparse'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
provides=('logparse')
conflicts=("${provides[@]}")
depends=('bash' 'jq')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
}

build() {
  cd "$_pkgname"

  : Nothing to do…
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" logparse
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" examples/*.log
}

# eof
