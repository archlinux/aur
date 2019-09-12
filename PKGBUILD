# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=gblocks-bin
_pkgname=Gblocks
pkgver=0.91b
pkgrel=1
pkgdesc="A program written in ANSI C language that eliminates poorly aligned\
 positions and divergent regions of an alignment of DNA or protein sequences"

url='http://molevol.cmima.csic.es/castresana/Gblocks.html'
arch=('x86_64')

license=('unknown')

depends=('glibc')

source=("http://molevol.cmima.csic.es/castresana/$_pkgname/${_pkgname}_Linux64_0.91b.tar.Z")
sha256sums=('563658f03cc5e76234a8aa705bdc149398defec813d3a0c172b5f94c06c880dc')


check() {
  cd ${_pkgname}_$pkgver/

  shasum_out1='22e011512c72968e23788c036954f9206574ebb937125ec5e16bf2ca9a039c6a'
  shasum_out2='b9d7ca2403a33eb49c9449028d8d88a3a930bebc8de40a8cf5f6bbc3bafc4f66'

  echo -e "o\nnad3.pir\ng\nq" | ./$_pkgname >/dev/null 2>&1 || true

  if ! ( sha256sum nad3.pir-gb | grep -q $shasum_out1 ) && ! ( sha256sum nad3.pir-gb.htm | grep -q $shasum_out2 )
    then
      echo 'The digest of the output files do not match.'
      exit 1
  fi
}


package() {
  install -Dm755 ${_pkgname}_$pkgver/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
