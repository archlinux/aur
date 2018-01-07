# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Fredrik Hammar <Horney_C86@Hotmail.com>

pkgname=dvdrip
pkgver=0.98.11
pkgrel=13
pkgdesc="A Gtk frontend for transcode writen in Perl"
arch=('x86_64')
license=('custom')
url="http://www.exit1.org/dvdrip/"
depends=('perl-gtk2-ex-formfactory' 'transcode' 'imagemagick'
         'perl-libintl-perl' 'desktop-file-utils' 'perl-event-execflow')
optdepends=('ogmtools: for ogm/odd video creation'
            'lsdvd: fast reading of DVD table'
            'fping: for cluster support')
source=("http://www.exit1.org/dvdrip/dist/${pkgname}-${pkgver}.tar.gz"
        'dvdrip.desktop')
options=('!emptydirs' '!makeflags')
md5sums=('6dfa4199d451757a37eea233a07da4c0'
         'e91cf411928fd0500d07a0022b4ef546')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete

  install -Dm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
