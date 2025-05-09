# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slcurl-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.2.2-13
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='A cURL module for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'libcurl.so' 'slang')
provides=('slcurl')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}/$_pkgname-$_prever.tar.gz")
md5sums=('b343f67adb443fd883ef67936faea661')               # Taken from $url
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
  '5521596bd6f60e2a26e54c1cddaad33046cc90e35b643b08e66bd0e5207866696e3c6e5bafabef127a9736889ae9ce05d8ff18ab1e72c14a64d0e9ecb2546bcf'
)

# eof
