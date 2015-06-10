# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gchooser
pkgver=0.08
pkgrel=1
pkgdesc="An XDM chooser writen in gtk2-perl."
arch=('any')
url="http://github.com/bbidulock/gchooser"
license=('PerlArtistic' 'GPL')
depends=('gtk2-perl' 'perl-net-interface' 'perl-net-ip')
options=('!emptydirs')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/gchooser.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" INSTALLVENDORSCRIPT=/usr/lib/X11/xdm install
  install -m0644 banner.png "$pkgdir/usr/lib/X11/xdm/banner.png"
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
