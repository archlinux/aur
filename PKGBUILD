# $Id: PKGBUILD 137423 2015-07-26 14:50:18Z seblu $
# Maintainer: Sébastien Luttringer
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Manolis Tzanidakis

pkgname=makepasswd
pkgver=1.10_10
pkgrel=1
pkgdesc='Generates true random passwords with the emphasis on security over pronounceability (Debian version)'
arch=('any')
url='http://packages.qa.debian.org/m/makepasswd.html'
license=('GPL2')
depends=('perl-passwd-md5' 'perl-crypt-openssl-random')
source=("http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver%_*}.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver//_/-}.diff.gz")
md5sums=('55842bb4c064ebcdedffb4afd5f0945a'
         'e9ec121ed24c08f7b9b21b325f3a9fef')

prepare() {
  patch -p1 -d "$pkgname-${pkgver%_*}" < "${pkgname}_${pkgver//_/-}.diff"
}

check() {
  ./makepasswd
}

package() {
  cd $pkgname-${pkgver%_*}
  install -D -m0755 makepasswd "$pkgdir/usr/bin/makepasswd"
  install -D -m0644 makepasswd.1 "$pkgdir/usr/share/man/man1/makepasswd.1"
}

# vim:set ts=2 sw=2 et:
