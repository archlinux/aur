# Simple NEtwork Backup Utility/Systems Nominal, Everything's Backed Up
# Maintainer: Dian M Fay <dian dot m dot fay at gmail dot com>
# Contributor: Derek Pressnall <dspgh at needcaffeine dot net> (developer/original uploader)
pkgname=snebu
pkgver=1.1.2
pkgrel=1
pkgdesc="A snapshot style multiple-client backup program"
url="https://www.snebu.com"
license=("GPL3")
depends=("sqlite" "bash" "lzo" "openssl")
arch=("i686" "x86_64")
backup=("etc/snebu.conf")
source=(
  "https://github.com/derekp7/snebu/archive/v1.1.2.tar.gz"
  snebu-sysusers.conf
)
md5sums=('e929cd899bb4e1aec734bd6db5786524'
         'a0a587462fe268bcb5c8cb05df3ee1e6')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  install -Dm644 "$srcdir/snebu-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/snebu.conf"

  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
