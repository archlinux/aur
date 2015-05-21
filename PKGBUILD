pkgname=ipv6calc
pkgver=0.97.4
pkgrel=1
pkgdesc='Small utility to manipulate, convert and calculate (more than) IPv6 addresses'
url='http://www.deepspace6.net/projects/ipv6calc.html'
license=('GPL2')
source=("ftp://ftp.bieringer.de/pub/linux/IPv6/ipv6calc/ipv6calc-${pkgver}.tar.gz")
md5sums=('a7414ca72f66eb6d515b58c687705d55')
arch=('i686' 'x86_64')
checkdepends=('perl-digest-sha1' 'perl-uri')
options=('!buildflags')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Run autotools.
  autoconf
}

build() {
  cd "${pkgname}-${pkgver}"

  # Configure the build.
  ./configure \
    --prefix="${pkgdir}/usr"

  sed -i -e "s#\${prefix}#$pkgdir/usr#g" man/Makefile

  # Build it!
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the program.
  make install
}

# vim:set ts=2 sw=2 et:
