# Maintainer: Szu-Han Chen <sjchen@sjchen.com>
# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
pkgname=pisg
pkgdesc="An irc log parser"
pkgver=0.73
pkgrel=1
url="http://pisg.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('perl')
backup=('etc/pisg/pisg.cfg')
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
install=$pkgname.install
md5sums=('e0d43082c0bc20e19978743ebf2fcf8b')

package() {

  mkdir -p "${pkgdir}/usr/bin/"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 pisg "${pkgdir}/usr/bin/"

  mkdir -p ${pkgdir}/etc/${pkgname}/{gfx,layout,scripts/{addalias,pum}}

  install -Dm644 COPYING README lang.txt pisg.cfg "${pkgdir}/etc/${pkgname}/"

  cd ./scripts
  install -Dm755 addalias/addalias.pl "${pkgdir}/etc/${pkgname}/scripts/addalias/"
  install -Dm644 addalias/README "${pkgdir}/etc/${pkgname}/scripts/addalias/"
  install -Dm755 pum/pum.pl "${pkgdir}/etc/${pkgname}/scripts/pum/"
  install -Dm644 pum/pum.conf "${pkgdir}/etc/${pkgname}/scripts/pum/"
  install -Dm644 crontab *.pl *.awk *.tcl *.sed *.txt "${pkgdir}/etc/${pkgname}/scripts/"

  cd ..
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/dev/"
  install -Dm644 ./docs/dev/* "${pkgdir}/usr/share/doc/${pkgname}/dev/"
  find ./docs -maxdepth 0 -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}" \;

  mkdir -p "${pkgdir}/usr/lib/${pkgname}/modules/Pisg/Parser/Format"
  install -Dm644 ./modules/Pisg/Parser/Format/*.pm "${pkgdir}/usr/lib/${pkgname}/modules/Pisg/Parser/Format/"
  install -Dm644 ./modules/*.pm "${pkgdir}/usr/lib/${pkgname}/modules/"
  install -Dm644 ./modules/Pisg/*.pm "${pkgdir}/usr/lib/${pkgname}/modules/Pisg/"
  install -Dm644 ./modules/Pisg/Parser/*.pm "${pkgdir}/usr/lib/${pkgname}/modules/Pisg/Parser/"


  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gfx/*.png "${pkgdir}/etc/${pkgname}/gfx/"
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/layout/*.css "${pkgdir}/etc/${pkgname}/layout/"
}	
