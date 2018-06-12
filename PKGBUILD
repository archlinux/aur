# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Sven Schwedas <sven.schwedas@tao.at>

pkgname=dh-strip-nondeterminism
_gitcommit=44531930caaebfbb56700a117c5de28c9d55f17e
pkgver=0.041
pkgrel=2
pkgdesc='Tool for stripping bits of non-deterministic information from files, supports dh'
url='https://salsa.debian.org/reproducible-builds/strip-nondeterminism'
arch=('any')
license=('GPL3')
depends=("perl" 'perl-archive-zip' 'perl-archive-cpio')
makedepends=('git')
conflicts=('strip-nondeterminism')
provides=('strip-nondeterminism')
options=('!emptydirs')
source=(${pkgname}::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git#commit=${_gitcommit}")
sha512sums=('SKIP')
validpgpkeys=('C2FE4BD271C139B86C533E461E953E27D4311E58'  # Chris Lamb <lamby@debian.org>
              'EF5D84C1838F2EB6D8968C0410378EFC2080080C'  # Andrew Ayer <agwa@andrewayer.name>
              '2F5DAF3FC1F793D94F3D900CA721DA055374AA4F'  # Reiner Herrmann <reiner@reiner-h.de>
              '66AE2B4AFCCF3F52DA184D184B043FCDB9444540') # Mattia Rizzolo <mattia@debian.org>

pkgver() {
  cd ${pkgname}
  git describe --always | sed 's/^v//;s/-/./g'
}

#prepare() {
#  cd ${pkgname}
#  sed -r 's|bin/dh_strip_nondeterminism ||g' -i Makefile.PL
#}

build() {
  cd ${pkgname}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  make -C ${pkgname} test
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
