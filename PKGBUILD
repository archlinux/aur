# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slcurl-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.2.2-14
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc='A cURL module for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'libcurl.so' 'slang')
provides=('slcurl')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}$_pkgname-$_prever.tar.gz")
md5sums=('05a88abdad29e80e7ddcd7ab3c209494')               # Taken from $url
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
  'f0bbc1a7a49d93c74b70cfd37fec4fef00e73f69f39005e1db2ed646623bdb751bb693168d8600701a1f7aa0d98cfa2ced0f72f8f081b3c450f0a2540d204db1'
)

# eof
