# Mainteriner: Network Jack <Network_Jack@null.net>
# Contributor: Daniel Müllner <daniel@danifold.net>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Manolis Tzanidakis

pkgname=makepasswd
pkgver=1.10_16
_pkgver=1.10-16
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
        "http://ftp.debian.org/debian/pool/main/m/makepasswd/makepasswd_${_pkgver}.debian.tar.xz")
sha256sums=('41491f361d810f9bb3e08b40df3c3034faec306d434dab15534e19023f91a75c'
            '056b9401b9a8aa2f1457d3b14aea2c5dea5932ce42d77cd8b3e516a825cba6f0')

prepare() {
  ln -s "../debian/patches" "${pkgname}-${pkgver%_*}/patches"
  cd "${pkgname}-${pkgver%_*}"
  series=$(cat patches/series)
  for file in ${series};do
     patch -Np1 -i "patches/${file}"
  done
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
