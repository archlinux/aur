# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-re-engine-re2
pkgver=0.18
pkgrel=1
pkgdesc="Replaces perl's regex engine in a given lexical scope with RE2"
arch=('x86_64')
url="https://github.com/dgl/re-engine-RE2"
license=('GPL' 'PerlArtistic')
depends=('perl' 'gcc-libs' 'glibc' 're2')
makedepends=('perl-extutils-cppguess')
source=("https://www.cpan.org/modules/by-module/re/re-engine-RE2-${pkgver}.tar.gz"
        "https://src.fedoraproject.org/rpms/perl-re-engine-RE2/raw/d82ae9a185248467deb08e391be5febcd6c8da9e/f/re-engine-RE2-0.18-Unbundle-re2.patch")
sha512sums=('3ecfd9cfc68703e23ba96dfb4b9e61afd8eb2f098c3c089b170efe30015425d891cc353362e7c56418e6e36d25e6dcaad96f52f659310458d696351bb0c77f74'
            '1e7364d45ea1ff97dfdfd1afbbc2c8a8f5b8284da6bd128d967aeb01791033c8720c68fef03a296898450d0a03a459b844217143faea341764fdcfa447efdfc6')

prepare() {
  cd "${srcdir}/re-engine-RE2-${pkgver}"

  rm -rf re2
  patch -Np1 < "${srcdir}/re-engine-RE2-0.18-Unbundle-re2.patch"
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
