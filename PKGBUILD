# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.0
pkgrel=3
pkgdesc="LaTeX to XML converter"
arch=('i686' 'x86_64')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl' 'perl-parse-recdescent' 
    'imagemagick' 'perl-xml-libxml' 
    'perl-xml-libxslt' 'db' 'texlive-core'
    'perl-image-size' 'perl-file-which')
options=(!emptydirs)
source=("http://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
sha256sums=('a495019f2828f0734e9e41f0398f6c8d60ba6a934d4ccad4fea7d588ab060388')

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

