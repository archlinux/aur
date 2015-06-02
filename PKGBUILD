# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
pkgname=husk
pkgver=0.9.13
pkgrel=1
pkgdesc="An iptables front-end to allow rules to be expressed in a more flexible, free-form style using language."
arch=('any')
url="http://huskfw.info/"
license=('GPL')
depends=('coreutils' 'iptables' 'perl' 'perl-config-inifiles' 'perl-config-simple')
makedepends=('make')
conflicts=('husk-git')
backup=('etc/husk/addr_groups.conf'
        'etc/husk/husk.conf'
        'etc/husk/interfaces.conf')
source=("https://github.com/fukawi2/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0219ea53c0c95318d6b2c58b21fc0692')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i Makefile \
      -e 's|/usr/local/|/usr/|g' \
      -e 's|/usr/sbin|/usr/bin|g' \
      -e 's|pod2man|/usr/bin/core_perl/pod2man|g' \
      -e 's|pod2html|/usr/bin/core_perl/pod2html|g'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
