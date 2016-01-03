# Current maintainer: Ben Ruijl
# Old maintainers: Jarrod Henry, Andy McMillan

pkgname=scrivener
pkgver=1.9.0.1
pkgrel=1
pkgdesc="A powerful content-generation tool for writers"
arch=('x86_64')
url="http://www.literatureandlatte.com/scrivener.php"
license=('custom')
depends=('gstreamer0.10-base-plugins' 'libxrender' 'fontconfig' 'libpng12')
optdepends=('aspell:       needed for spell checking (also needs dictionaries)'
            'multimarkdown: needed for export to latex')
source=("http://www.literatureandlatte.com/scrivenerforlinux/scrivener-${pkgver}-amd64.tar.gz"
        "scrivener.png" "scrivener.desktop")
sha256sums=('7abd6ee279af90a0a63df7f2eb2e35ea087721d3dacb0583167f68bf57926901'
            'f8ab2f4d9ae61e443ea72ac11dc8e2671e8bb5ec3c6e51a7b3b7c35aa621449d'
            '75d2efffb2539a3c3de2b10ddb47f20b06790128721138f90bf09aec29f69fd5')

package() {
  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
  mkdir -p "${pkgdir}/usr/share/doc/$pkgname"
  mkdir -p "${pkgdir}/usr/share/applications/$pkgname"
  mkdir -p "${pkgdir}/usr/share/pixmaps/$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mv "${srcdir}/scrivener-${pkgver}-amd64/licence.htm" "${pkgdir}"/usr/share/licenses/"$pkgname/"
  ln -s /opt/scrivener/bin/scrivener.sh "${pkgdir}"/usr/bin/scrivener
  install -D -m644 "${srcdir}"/scrivener.desktop "${pkgdir}"/usr/share/applications/"$pkgname/"
  install -D -m644 "${srcdir}"/scrivener.png "${pkgdir}"/usr/share/pixmaps/"$pkgname/"
  mv "${srcdir}"/scrivener-${pkgver}-amd64/bin/ "${pkgdir}"/opt/"$pkgname/"
  mv "${srcdir}"/scrivener-${pkgver}-amd64/lib/ "${pkgdir}"/opt/"$pkgname/"
  mv "${srcdir}"/scrivener-${pkgver}-amd64/readme.txt "${pkgdir}"/usr/share/doc/"${pkgname}"

  #file names cause errors, if this is needed for you 
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/portugu*s.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/espa*ol.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/rom*ne*te.alias
  rm -r $pkgdir/opt/scrivener/bin/Aspell/dict/f*royskt.alias

  #clean up files that libtool is leaving behind
  rm "${pkgdir}"/opt/"${pkgname}"/lib/*la
}


# vim:set ts=2 sw=2 et: