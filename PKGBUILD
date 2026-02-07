# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='most-snapshot'
_pkgname="${pkgname/-snapshot/}"
# shellcheck disable=SC1112
pkgdesc='A terminal pager similar to ‘more’ and ‘less’ (latest development snapshot)'
pkgver=5.3.0.8
_prever='pre5.3.0-8'
pkgrel=1
epoch=1
url='https://www.jedsoft.org/most/'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'slang')
provides=('most')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("https://www.jedsoft.org/snapshots/$_pkgname-$_prever.tar.gz")
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis <davis@space.mit.edu>
# Taken from https://jedsoft.org/snapshots/
md5sums=('3a74d9d5975ae2d93b4d2ff7e9b41809')

build() {
  cd "$srcdir/$_pkgname-$_prever"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install

  cd "$pkgdir/usr/share/doc/" && ln -srf "$_pkgname" "$pkgname"
}

# Calculated
sha256sums=(
  '92c5f8b0d6e072338792094d2cf38d627e8577cac8440320672d99391ee17e24'
)

# eof
