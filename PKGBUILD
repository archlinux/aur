# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=glsof
pkgver=2.4.1
_fmver=2.4.1
_qver=1.0.0
pkgrel=2
pkgdesc="Two separate GUI utilities (Queries and Filemonitor) to the lsof command line utility"
arch=('x86_64')
url="http://glsof.sourceforge.net/"
license=('GPL3')
depends=('sh' 'java-runtime' 'lsof')
source=(http://downloads.sourceforge.net/sourceforge/glsof/filemonitor-${_fmver}.tar.gz \
        http://downloads.sourceforge.net/sourceforge/glsof/queries-${_qver}/queries_linux32.tar.gz \
        http://downloads.sourceforge.net/sourceforge/glsof/queries-${_qver}/queries_linux64.tar.gz \
        glsof-filemonitor glsof-queries)
sha512sums=('1f5d4c1d9a61f171b3ace65179947f9917e5e86eb419c8f85ff6ced3916449f48fa81ecdfdd5ce00bbd5a50ef11494c933457fbd811c8970cf3fd505432fb243'
            '1258f187adad0f887b4a460318dd41460aa835bb9ba9050c3049e83905959a8fda834fc0d168e3fc83741d2edb75c53afaf33e333a0765e147ec468ea9bda348'
            'b257a349a2abd07e7ea12ee41bb90deb2642afaa74167f3cf35b8444d394a32e7cd413b0832c1aba85eae4e6c347e3c6db248df2c94d84ba3bcaf6f736901175'
            '9d0a7de3d5cca953890264566acc19e53c48a085a06242c19245e2b4eea0318a78814acf1bac2541283ab5ddd9255feb40f634ff0086e69c7f3d2a5cd414f889'
            '1ba7d62828a3634a2c39df47db83f3059de14e1bc5eae40a8d5132c5302a02a07822b097fe843de2ffa272e806d8e5fbae8d7fef4861251635b03376f2340264')

package() {
  cd "${srcdir}"
  install -D -m755 glsof-filemonitor "${pkgdir}/usr/bin/glsof-filemonitor"
  install -D -m755 glsof-queries "${pkgdir}/usr/bin/glsof-queries"
  install -d "${pkgdir}/usr/share/java/glsof"
  install -D -m644 filemonitor/*.jar "${pkgdir}/usr/share/java/glsof"
  install -D -m644 filemonitor/*.txt "${pkgdir}/usr/share/java/glsof"
  if [ "$CARCH" = "i686" ]; then
    install -D -m644 queries_linux32/queries.jar "${pkgdir}/usr/share/java/glsof/queries.jar"
    install -D -m644 queries_linux32/queries.pdf "${pkgdir}/usr/share/doc/glsof/queries.pdf"
  elif [ "$CARCH" = "x86_64" ]; then
    install -D -m644 queries_linux64/queries.jar "${pkgdir}/usr/share/java/glsof/queries.jar"
    install -D -m644 queries_linux64/queries.pdf "${pkgdir}/usr/share/doc/glsof/queries.pdf"
  fi
}
