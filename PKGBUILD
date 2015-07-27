# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Billy Congo <billycongo@gmail.com>
# Contributor: froggie <sullivanva@gmail.com>
# Contributor: Lukas Martini <hello@lutoma.org>

set -u
pkgname='mhonarc'
pkgver='2.6.18'
pkgrel='1'
pkgdesc='MHonArc is a Perl mail-to-HTML converter.'
license=('GPL')
arch=('any')
depends=('perl>=5.10.0')
source=("http://www.mhonarc.org/release/MHonArc/tar/MHonArc-${pkgver}.tar.bz2")
url='http://www.mhonarc.org/'

sha256sums=('4fd014cf69c40ae7d50a9dca519f279a09563004b200edb86b7c8c6f3e3fb534')

prepare() {
  set -u
  cd "${srcdir}/MHonArc-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor' \
    PREFIX="${pkgdir}/usr/"
  set +u
}

build() {
  set -u
  cd "${srcdir}/MHonArc-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd "${srcdir}/MHonArc-${pkgver}"
  make install

  # move /usr/doc to /usr/share/doc for FHS-compliance. 
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  # remove perllocal.pod and .packlist (these don't seem to exist any more)
  find "${pkgdir}" -name 'perllocal.pod' -delete
  find "${pkgdir}" -name '.packlist' -delete
  set +u
}
set +u
