# Maintainer: James An <james@jamesan.ca>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=perl-xml-xsh
_realname=XML-XSH2
pkgver=2.1.17
pkgrel=1
pkgdesc="XSH - XML editing shell"
arch=("any")
url="http://xsh.sourceforge.net/"
license=("GPL" "Artistic")
depends=('perl>=5.10.0' 'perl-io-stringy' 'perl-term-readline' 'perl-parse-recdescent' 'perl-xml-libxslt' 'perl-xml-sax-writer' 'perl-xml-xupdate-libxml' 'perl-xml-filter-domfilter-libxml')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOROBA/${_realname}-$pkgver.tar.gz)
md5sums=('0d1b30e7f6182afe81124448853d08a5')
options=(!emptydirs)

build() {
  cd ${_realname}-${pkgver}

  # Install module into the vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

check() {
  cd ${_realname}-${pkgver}

  make test || return 1
}

package() {
  cd ${_realname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
