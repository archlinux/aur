# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slsqlite-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.6.5
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
md5sums=('3a5ce0418028757716935b192f189b57')               # Taken from $url
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
  '19d11f8cf3648527a9ab979993cb1b97494ed9ea8acb3fcb407cb4f5656b5df80373edad80846751bc970eebe015193adbf3eed14878870b928828dbfc4e88f5'
)

# eof
