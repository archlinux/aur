# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-re-engine-re2
pkgver=0.13
pkgrel=1
pkgdesc="Module for handling arrays using integer ranges"
arch=('x86_64')
url="https://github.com/dgl/re-engine-RE2"
license=('GPL' 'PerlArtistic')
depends=('perl' 're2')
makedepends=('perl-extutils-cppguess')
source=("https://www.cpan.org/modules/by-module/re/re-engine-RE2-${pkgver}.tar.gz"
        "https://rt.cpan.org/Ticket/Attachment/1183237/624278/re-engine-RE2-0.11-Unbundle-re2.patch"
        "perl5.24.patch::https://github.com/dgl/re-engine-RE2/pull/1.patch"
        "perl5.29.9.patch")
sha512sums=('c0c04f9115b4d84786bbac7de461a2b133dcea3986f2586739d9aabc8c50b0bd66409118d9cc3397236a138c78779327844abe48d116b0b56d82e40311520cca'
            'c3bda383bd7c81666c1770f12728b3dce653c90b43b3ddb98268bfd59bb14247750bdb1f36d20b5d3b943910298375747360da1d7e10fd22438a66a5d2395cce'
            '811c997ccccd908daa91fbc70b91d16c6672532e86b79b1bcdd68ef1e60334c6babeeee5c68256b08b55c9d545b23aabf2944ea3a110116314a02fe601196d81'
            '35fa432ea26d975a9a163cf41316e7816fc4ef74b5342996055bb4900aa5c370a9ba0c82a8f05c9f20d36d078c1b8484aa703267a41e738894c2e9f85ac053e0')

prepare() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  patch -Np1 < "${srcdir}/re-engine-RE2-0.11-Unbundle-re2.patch"
  patch -Np1 < "${srcdir}/perl5.24.patch"
  patch -Np1 < "${srcdir}/perl5.29.9.patch"
}

build() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
