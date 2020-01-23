# Maintainer: Jonathon Fernyhough <jonathon "at manjaro+dot+org>
# Contributor: Aitor Alonso <mail@aalonso.pw>
# Contributor: Andrew Chen <andrew.chuanye.chen@gmail.com>
# Contributor: mmm
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=weka
pkgver=3.8.4
_dlver=${pkgver//./-}
pkgrel=1
pkgdesc="A collection of machine learning algorithms for data mining tasks"
url="http://www.cs.waikato.ac.nz/ml/weka/"
license=("GPL")
arch=('any')
depends=('java-runtime')
makedepends=('java-environment')
source=(http://downloads.sourceforge.net/sourceforge/weka/$pkgname-$_dlver.zip
        weka.sh
        weka.desktop
        weka.png)
sha256sums=('ffca58c609d15b78775253f83850c23a0b8dcd57360b97058ceb94da0e0c6821'
            '562675f852f6983589de3478f4cfeb942c30c16b3f51de9626da4d87942e01ab'
            '753ef1dc1fae92e6bbca45e9f7279c129dad155d3b7e58279b77bb775fcf715d'
            '6cb96deb1e8634048032400674faf2ef869ac090deee66d637051a5d1af42655')

package() {
  cd $pkgname-$_dlver

  # Install jar file
  mkdir -p "$pkgdir"/usr/share/java/$pkgname
  install -m644 weka.jar "$pkgdir"/usr/share/java/$pkgname/weka.jar

  # Documentation
  DOC_DIR="${pkgdir}/usr/share/doc/${pkgbase}"
  install -d -m755 "$DOC_DIR"
  install -m644 {documentation.*,README,*.pdf} "$DOC_DIR"
  cp -dr --no-preserve=ownership doc "$DOC_DIR"
   
  # Example data files
  DATA_DIR="${pkgdir}/usr/share/data/${pkgbase}"
  install -d -m755 data "$DATA_DIR"
  install -m644 data/* "$DATA_DIR"

  # Setup for freedesktop icons and shell script
  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
  mkdir -p "$pkgdir"/usr/bin
  install -m644 "$srcdir"/weka.png     "$pkgdir"/usr/share/pixmaps/weka.png
  install -m644 "$srcdir"/weka.desktop "$pkgdir"/usr/share/applications/weka.desktop
  install -m755 "$srcdir"/weka.sh      "$pkgdir"/usr/bin/weka
}
