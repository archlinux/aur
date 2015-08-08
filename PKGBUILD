# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Maintainer: Abakus <java5@arcor.de>
# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=pam-opie
pkgver=0.21.debian8
_debver=0.21
_debrel=8
pkgrel=1
pkgdesc="S/KEY support for PAM"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/sid/libpam-opie"
depends=('pam')
replaces=('libpam-opie')
source=("http://ftp.de.debian.org/debian/pool/main/libp/libpam-opie/libpam-opie_$_debver.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/libp/libpam-opie/libpam-opie_$_debver-$_debrel.diff.gz"
        "fix-libopie-path.diff")
sha1sums=('6bcce6f9f1136cdc60451ca62f0cd8583e341b58'
          '893988d2c3e7b79bc4697fc44832b45263797de0'
          'c519858bf33558ff02876529324f67877a68cfa0')

build() {
  cd "$srcdir/libpam-opie-${_debver}"
  patch -p1 < "../libpam-opie_${_debver}-${_debrel}.diff"
  patch -p1 < "../fix-libopie-path.diff"
  make -C libopie
  make
}

package() {
  cd "$srcdir/libpam-opie-${_debver}"
  install -D pam_opie.so "$pkgdir/usr/lib/security/pam_opie.so"
}

# vim: ts=2:sw=2:et
