# Maintainer: John C F <john.ch.fr [at] gmail [dot] com>

pkgname=woff2-bin
pkgver=1.0.2
_debver=1.0.2-1
pkgrel=1
pkgdesc=""
url="https://github.com/google/woff2"
arch=(x86_64)
license=(MIT)
depends=(brotli)
conflicts=(woff2 woff2-git)

source_x86_64=(
    http://httpredir.debian.org/debian/pool/main/w/woff2/libwoff1_${_debver}_amd64.deb
    http://httpredir.debian.org/debian/pool/main/w/woff2/libwoff-dev_${_debver}_amd64.deb
    http://httpredir.debian.org/debian/pool/main/w/woff2/woff2_${_debver}_amd64.deb)
noextract=(libwoff1_${_debver}_amd64.deb
           libwoff-dev_${_debver}_amd64.deb
           woff2_${_debver}_amd64.deb)

sha1sums_x86_64=('4e50cce8dd19a399a36c9d109e17e8ab838cf25e'
                 'e3fc8fc4e245881b30650509ffe3f6e639632a47'
                 '4e1d97b96222dd10d53eb813c12dd861f49b308d')

prepare() {
  mkdir -p libwoff1 libwoff-dev woff2
  bsdtar -xf libwoff1_${_debver}_amd64.deb -C libwoff1
  bsdtar -xf libwoff-dev_${_debver}_amd64.deb -C libwoff-dev
  bsdtar -xf woff2_${_debver}_amd64.deb -C woff2
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  tar -xf libwoff1/data.tar.?z -C "$pkgdir/usr/lib" --strip=4 ./usr/lib/x86_64-linux-gnu
  tar -xf libwoff-dev/data.tar.?z -C "$pkgdir/usr/lib" --strip=4 ./usr/lib/x86_64-linux-gnu
  tar -xf woff2/data.tar.?z -C "$pkgdir" ./usr/bin ./usr/share/doc/woff2/copyright
}
