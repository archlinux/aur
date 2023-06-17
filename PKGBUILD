# Mainteriner: GI Jack <GI_Jack@hackermail.com>
# Contributor: Daniel Müllner <daniel@danifold.net>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Manolis Tzanidakis

pkgname=makepasswd
pkgver=1.10_12
pkgrel=1
pkgdesc='Generates true random passwords with the emphasis on security over pronounceability (Debian version)'
arch=('any')
url='http://packages.qa.debian.org/m/makepasswd.html'
license=('GPL2')
depends=('perl-passwd-md5'
         'perl-crypt-openssl-random'
         'perl-bytes-random-secure'
         'perl-crypt-random-seed')
source=("http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver%_*}.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver//_/-}.diff.gz")
sha256sums=('41491f361d810f9bb3e08b40df3c3034faec306d434dab15534e19023f91a75c'
            'e72d5f45de382fc70b108d692ca4fc2f66fcc280d693a54982ec2ae0ef1d712c')

prepare() {
  patch -p1 -d "$pkgname-${pkgver%_*}" < "${pkgname}_${pkgver//_/-}.diff"
}

check() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  ./makepasswd
}

package() {
  cd $pkgname-${pkgver%_*}
  install -D -m0755 makepasswd "$pkgdir/usr/bin/makepasswd"
  install -D -m0644 makepasswd.1 "$pkgdir/usr/share/man/man1/makepasswd.1"
}

# vim:set ts=2 sw=2 et:
