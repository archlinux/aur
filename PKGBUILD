# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-re-engine-re2
pkgver=0.14
pkgrel=1
pkgdesc="Module for handling arrays using integer ranges"
arch=('x86_64')
url="https://github.com/dgl/re-engine-RE2"
license=('GPL' 'PerlArtistic')
depends=('perl' 're2')
makedepends=('perl-extutils-cppguess')
source=("https://www.cpan.org/modules/by-module/re/re-engine-RE2-${pkgver}.tar.gz"
        "use-c++11-for-re2.patch::https://github.com/dgl/re-engine-RE2/pull/5.patch"
        "https://rt.cpan.org/Ticket/Attachment/1183237/624278/re-engine-RE2-0.11-Unbundle-re2.patch")
sha512sums=('8eab9d55185af7e5356e90c9e63495d65f4b4ace6aff3828f7178fab0104bcd8c7f58b52e49e1f24cd394183e9455b11c7a1ad2a13986c1c3ff6e11ebe5c0dbe'
            'c45fea8fe500752d1b6ea31186d0991175e289258b0a9ba35a5db98d6ff8245f8ffdfdd283fec261d3672d2f52cd9bef3c15fe9b7fc2ee18965b9f653afb77ea'
            'c3bda383bd7c81666c1770f12728b3dce653c90b43b3ddb98268bfd59bb14247750bdb1f36d20b5d3b943910298375747360da1d7e10fd22438a66a5d2395cce')

prepare() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  patch -Rp1 < "${srcdir}/use-c++11-for-re2.patch"
  patch -Np1 < "${srcdir}/re-engine-RE2-0.11-Unbundle-re2.patch"
}

build() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
