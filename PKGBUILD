# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Sajeev Ramasamy <thorion3006@gmail.com>

_pkgname='dracula-icons'
pkgname="$_pkgname-git"
pkgdesc='Dark icons theme for Linux desktops (development version)'
pkgver=1.0.0.r24.gde2a8ed
pkgrel=1
epoch=1
url='https://github.com/m4thewz/dracula-icons'
arch=('any')
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=('findutils' 'git')
provides=('dracula-icons')
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '1.0.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -dm0755 "$pkgdir/usr/share/icons/Dracula"
  cp -fa dracula-icons/* "$pkgdir/usr/share/icons/Dracula/"
  find "$pkgdir/usr/share/icons/Dracula" -type d -print0 \
    | xargs -r0 chmod 0755
  find "$pkgdir/usr/share/icons/Dracula" -type f -print0 \
    | xargs -r0 chmod 0644
  install -dm0755 "$pkgdir/usr/share/doc/$pkgname"
  mv -f "$pkgdir/usr/share/icons/Dracula/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/"
  cd "$pkgdir/usr/share/doc" && ln -sr "$pkgname" "$_pkgname"
}

# eof
