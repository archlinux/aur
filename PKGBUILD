# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.2
pkgrel=1
pkgdesc="LaTeX to XML converter"
arch=('i686' 'x86_64')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl' 'perl-parse-recdescent' 
    'imagemagick' 'perl-xml-libxml' 
    'perl-xml-libxslt' 'db' 'texlive-core'
    'perl-image-size' 'perl-file-which'
    'perl-libwww' 'perl-io-string' 'perl-archive-zip')
options=(!emptydirs)
source=("http://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
sha512sums=('521134f7b3820c2cbf8fbf60778f03f40b8bb6900311d82da986e8dd3ee1a0d518ef9bb4b852bd95a5bac758bb65b159218602f4adf454c77dfbf6280a4bd1a4')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORBIN=/usr/bin INSTALLVENDORSCRIPT=/usr/bin TEXMF=/usr/share/texmf
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh

