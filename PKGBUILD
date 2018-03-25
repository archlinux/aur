# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=2.0.1
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('any')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-date-calc' 'perl-goo-canvas2'
         'perl-gtk3-simplelist' 'perl-data-uuid'
         'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils'
         'perl-locale-gettext' 'perl-log-log4perl' 'perl-pdf-api2'
         'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan'
         'perl-try-tiny' 'unpaper')
optdepends=('djvulibre: DjVu image format'
            'gocr: OCR support'
            'ocropy: OCR support'
            'xdg-utils: email as PDF'
            'tesseract: OCR support'
            'cuneiform: OCR support'
            'perl-gtk2-ex-podviewer: view inline documentation')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('79ce308acd13a9e13dbdea055248f049a83c4c13394b2c2f3a76d154280abb11')
options=('!emptydirs')

build() {
  cd "${pkgname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"

  # Move files
  mv "${pkgdir}/usr/bin/vendor_perl/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Cleaning
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
