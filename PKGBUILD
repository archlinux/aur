# Current maintainer: Ben Ruijl
# Old maintainers: Jarrod Henry, Andy McMillan

pkgname=scrivener
pkgver=1.9.0.1
pkgrel=3
pkgdesc="A powerful content-generation tool for writers"
arch=('i686' 'x86_64')
url="http://www.literatureandlatte.com/scrivener.php"
license=('custom')
depends=('gstreamer0.10-base-plugins' 'libxrender' 'fontconfig' 'libpng12')
optdepends=('aspell:       needed for spell checking (also needs dictionaries)'
            'multimarkdown: needed for export to latex')
source=("scrivener.png" "scrivener.desktop")
sha256sums=('f8ab2f4d9ae61e443ea72ac11dc8e2671e8bb5ec3c6e51a7b3b7c35aa621449d'
            '75d2efffb2539a3c3de2b10ddb47f20b06790128721138f90bf09aec29f69fd5')
source_x86_64=("http://www.literatureandlatte.com/scrivenerforlinux/scrivener-${pkgver}-amd64.tar.gz")
sha256sums_x86_64=('7abd6ee279af90a0a63df7f2eb2e35ea087721d3dacb0583167f68bf57926901')
source_i686=("http://www.literatureandlatte.com/scrivenerforlinux/scrivener-${pkgver}-i386.tar.gz")
sha256sums_i686=('c24a80adb85458c4f0727f94acd773550395d5f88470711e90b788b84890179f')

package() {
  if [ "$CARCH" == "i686" ]; then
  	scrivdir="${srcdir}/scrivener-${pkgver}-i386"
  else
  	scrivdir="${srcdir}/scrivener-${pkgver}-amd64"
  fi

  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
  mkdir -p "${pkgdir}/usr/share/doc/$pkgname"
  mkdir -p "${pkgdir}/usr/share/applications/$pkgname"
  mkdir -p "${pkgdir}/usr/share/pixmaps/$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  ln -s /opt/scrivener/bin/scrivener.sh "${pkgdir}"/usr/bin/scrivener
  install -D -m644 "${srcdir}"/scrivener.desktop "${pkgdir}"/usr/share/applications/"$pkgname/"
  install -D -m644 "${srcdir}"/scrivener.png "${pkgdir}"/usr/share/pixmaps/"$pkgname/"
  mv "${scrivdir}"/licence.htm "${pkgdir}"/usr/share/licenses/"$pkgname/"
  mv "${scrivdir}"/bin/ "${pkgdir}"/opt/"$pkgname/"
  mv "${scrivdir}"/lib/ "${pkgdir}"/opt/"$pkgname/"
  mv "${scrivdir}"/readme.txt "${pkgdir}"/usr/share/doc/"${pkgname}"

  #file names cause errors, if this is needed for you 
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/portugu*s.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/espa*ol.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/rom*ne*te.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/f*royskt.alias

  #remove old version of libfreetype
  rm $pkgdir/opt/scrivener/lib/libfreetype.so.6

  #clean up files that libtool is leaving behind
  rm "${pkgdir}"/opt/"${pkgname}"/lib/*la
}


# vim:set ts=2 sw=2 et:
