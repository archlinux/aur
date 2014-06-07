# $Id: PKGBUILD 214236 2014-06-04 13:52:08Z bluewind $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: François Charette <francois ατ archlinux δοτ org>
# Contributor: Jason Chu <jchu@xentac.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=perl-tk-git
_pkgname=perl-tk
pkgver=804.032.r8.g2eaf2e3
pkgrel=2
pkgdesc="A graphical user interface toolkit for Perl"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Tk"
license=('PerlArtistic' 'GPL' 'custom')
depends=('libpng' 'libjpeg' 'tk' 'perl')
options=('!emptydirs')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/eserte/perl-tk.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

#check() {
#  cd $pkgname
#  make test
#}

package() {
  cd $pkgname
  make install DESTDIR="$pkgdir"

  # license
  install -D -m644 pTk/license.terms \
                   "${pkgdir}/usr/share/licenses/${pkgname}/tk.license"
  install -D -m644 pTk/Tix.license \
                   "${pkgdir}/usr/share/licenses/${pkgname}/tix.license"
}
