# Maintainer: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=1.7.2
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('any')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-date-calc' 'perl-goo-canvas' 'perl-gtk2-ex-simple-list' 'perl-gtk2-imageview' 'perl-data-uuid' 'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils' 
	'perl-locale-gettext' 'perl-log-log4perl' 
	'perl-pdf-api2' 'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan'
	  'perl-try-tiny' 'unpaper')
optdepends=('djvulibre' 'gocr' 'ocropus' 'xdg-utils' 'tesseract' 'cuneiform' 'perl-gtk2-ex-podviewer' )
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('67bb0e15b2b7a354609838a5f2826a2d91b8941c95dc7f286a87cf0ad37bffc94dd7593307251a44c9af8e5267d97bf70cc5da57bb41e0274ee3318abbd933cc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # Standard perl cleaning
  /usr/bin/find ${pkgdir} -name '.packlist' -o -name 'perllocal.pod' -delete
}
