# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=0.11.0
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
makedepends=()
depends=('inkscape' 'texlive-core' 'python2' 'pdf2svg')
optdepends=('pygtk' 'imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tar.gz")

sha256sums=('7c4f3ce72d75fcd42d3837189b2056e60575a7b646a5e520a31137ae16850ac0')

package() {
  install -d "$pkgdir"/usr/share/inkscape/extensions
  cd $pkgname-$pkgver/extension
  cp -r $pkgname "$pkgdir"/usr/share/inkscape/extensions
  install -m644 $pkgname.inx "$pkgdir"/usr/share/inkscape/extensions/
  cd ..
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd "$pkgdir"/usr/share/inkscape/extensions/$pkgname
  sed -i '1s+\#!/usr/bin/env python+\#!/usr/bin/env python2+' __init__.py typesetter.py
}

