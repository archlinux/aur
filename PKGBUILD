# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Woof <woofy1231@hotmail.com>
# Contributor: catwell <catwell@archlinux.us>

pkgname=ltsa
pkgver=3.0
pkgrel=6
pkgdesc="Labelled Transition System Analyser, a verification tool for concurrent systems"
arch=('any')
url="http://www.doc.ic.ac.uk/ltsa/"
license=('unknown')
depends=('java-runtime' 'bash' 'libcups')
install=ltsa.install
makedepends=('imagemagick' 'setconf' 'gendesk')
source=("http://www.doc.ic.ac.uk/~jnm/book/$pkgname/${pkgname}tool.zip"
        "$pkgname.sh")
sha256sums=('9ed894c4f2ae22e119a4f48e6e3f36b38b08f8fe85a6ac85564f4c5045fe9046'
            '34f53ef6b330e49d3eaeb8754703a09ac98d95052bf6c08abb9f0161bb66ff84')

build() {
  cd "$srcdir"
  gendesk -n
  setconf "$pkgname.desktop" Categories "Education;Java;"
  msg2 "Generating $pkgname.png..."
  convert "${pkgname}tool/$pkgname.ico" "$pkgname.png"
}

package() {
  cd "$srcdir/${pkgname}tool"

  mkdir -p "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/doc/$pkgname"
  msg2 "Packaging application..."
  cp -r *.jar "$pkgdir/usr/share/$pkgname"
  install -DTm755 "$startdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  msg2 "Packaging examples..."
  cp -r Chapter_examples "$pkgdir/usr/share/doc/$pkgname/examples"
  msg2 "Packaging icon and desktop shortcut..."
  cd "$srcdir"
  install -DTm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -DTm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

