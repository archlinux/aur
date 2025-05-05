# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slcurl-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.2.2-12
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc='cURL module for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'libcurl.so' 'slang')
provides=('slcurl')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}/$_pkgname-$_prever.tar.gz")
md5sums=('96c4f6bb2edc89074b3811946fe7afbf')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_prever"

  ./configure --prefix=/usr && make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install

  # Install extra documentation
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    changes.txt INSTALL.txt README doc/text/curl.txt
}

b2sums=(
  'e154b8bd2548cc69211c8b0e8efbdc28d8be45e928a780ce805bdf588f0821b1121423a15b3b44cfcb53f79a9a51b408afbb7e19b5da11e8fb373e1512ff75c7'
)

# eof
