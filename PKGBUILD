# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Fredrik Hammar <Horney_C86@Hotmail.com>

pkgname=dvdrip
pkgver=0.98.11
pkgrel=15
pkgdesc="DVD Ripper and Encoder - Backup and compression utility for DVDs"
arch=('x86_64')
license=('custom')
url="https://www.exit1.org/dvdrip/"
depends=('perl-gtk2-ex-form-factory' 'transcode' 'imagemagick'
         'perl-libintl-perl' 'desktop-file-utils' 'perl-event-execflow')
optdepends=('ogmtools: for ogm/odd video creation'
            'lsdvd: fast reading of DVD table'
            'fping: for cluster support')
source=("https://www.exit1.org/dvdrip/dist/${pkgname}-${pkgver}.tar.gz" 'dvdrip.desktop')
options=('!emptydirs' '!makeflags')
sha1sums=('b91d65e7307b5fecd1509ace03c02564ac9591c0'
          'ec76242fb295d42dd77ffb9b3defdff10583d029')

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
