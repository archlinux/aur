# Maintainer: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=1.3.2
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('i686' 'x86_64')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-goo-canvas' 'perl-gtk2-ex-simple-list' 'perl-gtk2-imageview' 
	'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils' 'perl-locale-gettext' 
	'perl-log-log4perl' 'perl-linux-distribution' 'perl-pdf-api2' 
	'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan' 'perl-try-tiny'
	 'unpaper')
optdepends=('djvulibre' 'gocr' 'ocropus' 'xdg-utils' 'tesseract' 'cuneiform' 'perl-gtk2-ex-podviewer' )
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('24d9ce872ba0dce811a9f7112174841d95277bd67b42686a90611f506fea57afd71bccd8f96653147f667db3f80463e7703dbfa648517d1cb476fb9905b333e3')

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
