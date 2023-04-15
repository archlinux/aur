# Maintainer: arch AT nnamuab DOT de
pkgname=phreeqc
pkgver=3.6.2
_pkgsvn=15100
pkgrel=2
pkgdesc="A Computer Program for Speciation, Batch-Reaction, One-Dimensional Transport, and Inverse Geochemical Calculations"
arch=('x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phreeqc/"
license=('custom:CC0')
depends=('gmp')
backup=()
install="install.sh"
source=("http://water.usgs.gov/water-resources/software/PHREEQC/${pkgname}-${pkgver}-${_pkgsvn}.tar.gz"
        install.sh
        phreeqc.el
<<<<<<< HEAD
       phreeqc_tmp_logfile.patch)
md5sums=('e820ea246adaa9ad23842d3470c5dde1'
         '8facd6e784cd1985b2c57c092b753002'
         'a35830b02368dba33419d904acfd64b4'
         'd5674ee727b944d4669e88514874fd51')
=======
        phreeqc-tmplog.patch)
md5sums=('e820ea246adaa9ad23842d3470c5dde1'
         '8facd6e784cd1985b2c57c092b753002'
         'a35830b02368dba33419d904acfd64b4'
         '88b218f5687246282a9cca3c3d95118d')
>>>>>>> 6baa1f5 (update to 3.7.3 and direct phreeqc logs into /tmp)


build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"
  patch -p0 -i "${srcdir}/phreeqc_tmp_logfile.patch"
  ./configure --prefix=/usr
  make CCFLAGS="-O3 -Wall -ansi -pedantic -DHAVE_ISFINITE -DNDEBUG -mtune=native"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"

  make DESTDIR="${pkgdir}" install
  
  # move database and example files into previous location
  mkdir -p ${pkgdir}/usr/share/phreeqc/
  mv ${pkgdir}/usr/share/doc/phreeqc/database ${pkgdir}/usr/share/phreeqc/
  mv ${pkgdir}/usr/share/doc/phreeqc/examples ${pkgdir}/usr/share/phreeqc/

  # install supplementary files
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/$pkgname
  install -m644 ../phreeqc.el ${pkgdir}/usr/share/emacs/site-lisp/$pkgname

  # install licence
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 doc/NOTICE ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
