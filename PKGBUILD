# Maintainer: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=1.3.5
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('i686' 'x86_64')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-goo-canvas' 'perl-gtk2-ex-simple-list' 'perl-gtk2-imageview' 
	'perl-data-uuid' 'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils' 
	'perl-locale-gettext' 'perl-log-log4perl' 
	'perl-pdf-api2' 'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan'
	  'perl-try-tiny' 'unpaper')
optdepends=('djvulibre' 'gocr' 'ocropus' 'xdg-utils' 'tesseract' 'cuneiform' 'perl-gtk2-ex-podviewer' )
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('7fec145d7ce69b4bbf79912a1eec0a0bbb4cb02608e3f5c957fa9d6e08ca6eff53162fb824b7f7851c388db8c8f8e19632ca4f760afbcf768099c9174f1f43bd')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}
  perl Makefile.PL
  make

}

package() {

  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  # Create symlinks to /usr/bin/site_perl/* in /usr/bin/
  cd ${pkgdir}
  ln -sf site_perl/gscan2pdf usr/bin/
  ln -sf site_perl/scanadf-perl usr/bin/
  ln -sf site_perl/scanimage-perl usr/bin/

  # Standard perl cleaning
  /usr/bin/find ${pkgdir} -name '.packlist' -o -name 'perllocal.pod' -delete
}
