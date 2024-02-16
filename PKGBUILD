# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='jedstate-git'
_pkgname="${pkgname/-git/}"
pkgver=1.0.0.r0.g81d6d40
pkgrel=1
pkgdesc='S-Lang module for the JED editor to remember its cursor position across invocations (built from latest commit)'
arch=('any')
url='https://codeberg.org/kas/jedstate'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('jed')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  bin/byte-comp
}

package() {
  cd "$_pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "src"

  install -Dm0644 jedstate.sl "$pkgdir/usr/share/jed/lib/jedstate.sl"
  install -Dm0644 jedstate.slc "$pkgdir/usr/share/jed/lib/jedstate.slc"

  install -Dm0644 jedstate-hooks.sl \
    "$pkgdir/usr/share/doc/$pkgname/jedstate-hooks.sl"
}

# eof
