# Maintainer: Szu-Han Chen <sjchen@sjchen.com>
# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
pkgname=pisg
pkgdesc="An irc log parser"
pkgver=0.73
pkgrel=2
url="http://pisg.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('perl')
backup=('etc/pisg/pisg.cfg')
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
install=$pkgname.install
md5sums=('e0d43082c0bc20e19978743ebf2fcf8b')

package() {

  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/etc/"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 pisg "${pkgdir}/usr/bin/"

  mkdir -p ${pkgdir}/usr/share/$pkgname/{lang,gfx,layout,scripts/{addalias,pum}}

  install -Dm644 pisg.cfg "${pkgdir}/etc/"

  install -Dm644 README lang.txt "${pkgdir}/usr/share/$pkgname/"

  cd scripts
  install -Dm755 addalias/addalias.pl "${pkgdir}/usr/share/$pkgname/scripts/addalias/"
  install -Dm644 addalias/README "${pkgdir}/usr/share/$pkgname/scripts/addalias/"
  install -Dm755 pum/pum.pl "${pkgdir}/usr/share/$pkgname/scripts/pum/"
  install -Dm644 pum/pum.conf "${pkgdir}/usr/share/$pkgname/scripts/pum/"
  install -Dm644 crontab *.pl *.awk *.tcl *.sed *.txt "${pkgdir}/usr/share/$pkgname/scripts/"

  cd ../docs
  mkdir -p "${pkgdir}/usr/share/doc/$pkgname/dev/"
  install -Dm644 dev/* "${pkgdir}/usr/share/doc/$pkgname/dev/"
  find . -maxdepth 1 -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}" \;

  cd ../modules
  perldir="$(perl -V:vendorarch | cut -d"'" -f2)"
  mkdir -p "${pkgdir}${perldir}/Pisg/Parser/Format"
  install -Dm644 Pisg/Parser/Format/*.pm "${pkgdir}${perldir}/Pisg/Parser/Format/"
  install -Dm644 *.pm "${pkgdir}${perldir}/"
  install -Dm644 Pisg/*.pm "${pkgdir}${perldir}/Pisg/"
  install -Dm644 Pisg/Parser/*.pm "${pkgdir}${perldir}/Pisg/Parser/"

  install -Dm644 ${srcdir}/$pkgname-$pkgver/gfx/*.png "${pkgdir}/usr/share/$pkgname/gfx/"
#  install -Dm644 ${srcdir}/$pkgname-$pkgver/lang/* "${pkgdir}/usr/share/$pkgname/lang/"
  install -Dm644 ${srcdir}/$pkgname-$pkgver/layout/*.css "${pkgdir}/usr/share/$pkgname/layout/"

}
