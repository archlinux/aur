# Maintainer: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=1.5.4
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('any')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-goo-canvas' 'perl-gtk2-ex-simple-list' 'perl-gtk2-imageview' 'perl-data-uuid' 'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils' 
	'perl-locale-gettext' 'perl-log-log4perl' 
	'perl-pdf-api2' 'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan'
	  'perl-try-tiny' 'unpaper')
optdepends=('djvulibre' 'gocr' 'ocropus' 'xdg-utils' 'tesseract' 'cuneiform' 'perl-gtk2-ex-podviewer' )
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('dd7cb9320d5c9836f70854769e6a567b7ca7558eee0870a18301ab556ccc733377d43254932366944c03eeedd3842093fee68383d0ef866c73858b2ab8e2397f')

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
