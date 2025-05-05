# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slsqlite-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.6.4
#_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='SQLite3 module for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'slang' 'sqlite')
provides=("$_pkgname")
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}$_pkgname-$pkgver.tar.gz")
md5sums=('0ebe85958674257943c1929de585ee45')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_pkgver"

  ./configure --prefix=/usr && make
}

package() {
  cd "$_pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install

  chmod -v 0755 "$pkgdir/usr/lib/slang/v2/modules/sqlite-module.so"
}

b2sums=(
  '9ba2122495930a52cfbbc21e928f101086b9ea00a266488e01805d0bd5af766e2fab6bf447d41bfb2b0222432359428a9061e9b4e505b8c5e826f3d836079e7a'
)

# eof
