# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# The pkgdesc is really long and not particularly pleasing as a
# result.  These utilties aren't entirely related to each other, but
# are distributed together.  Suggestions are welcome to making the
# pkgdesc suitably fit in 80 characters (the names of all the
# utilities in it are primarily to aide in searching the AUR for
# them.).

pkgname=cmdpack
pkgver=1.03
pkgrel=2
pkgdesc="Collection of command line utilities, most for emulation or disk images (bin2iso, bincomp, brrrip, byteshuf, byteswap, cdpatch, ecm, fakecrc, hax65816, id3point, pecompat, rels, screamf, subfile, uips, usfv, vb2rip, wordadd, zerofill)"
arch=('i686' 'x86_64')
url="http://www.neillcorlett.com/cmdpack/"
license=('GPL3')
provides=('ecm' 'unecm')
install=cmdpack.install
source=("http://www.neillcorlett.com/downloads/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('56a806f075dded183e29e85c9cda2c4662644a310e6916aea688a7b26f4e0a6c')

_utilties=('bin2iso' 'bincomp' 'brrrip' 'byteshuf' 'byteswap'
  'cdpatch' 'ecm' 'fakecrc' 'hax65816' 'id3point' 'pecompat' 'rels'
  'screamf' 'subfile' 'uips' 'usfv' 'vb2rip' 'wordadd' 'zerofill')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src/src/

  for elem in ${_utilties[@]}
  do
    gcc $CFLAGS $elem.c -o $elem
  done
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-src/src/

  for elem in ${_utilties[@]}
  do
    install -Dm755 $elem ${pkgdir}/usr/bin/cmdpack/$elem
  done

  ln ${pkgdir}/usr/bin/cmdpack/ecm ${pkgdir}/usr/bin/cmdpack/unecm

  install -Dm644 ../doc/cmdpack.txt ${pkgdir}/usr/share/doc/cmdpack/cmdpack.txt
}
