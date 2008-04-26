# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gtk2-perl
_realname=Gtk2
pkgver=1.182
pkgrel=1
pkgdesc="Gtk2-Perl allows Perl developers to write GTK+ 2.x applications."
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2>=2.12.9-2' 'glib-perl>=1.182' 'cairo-perl>=1.060' 'perl>=5.10.0')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('4ebd8fd38e551c319ddb638d26b525e3')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
