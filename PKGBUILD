# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=0.10.1
pkgrel=0
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
makedepends=('dos2unix')
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg' 'pygtk' 'imagemagick6')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tar.gz")

sha256sums=('084f3f6c1524b9591c976f39232c3d4e314fb4bdbe648ba605e4fd6d03d8d2ba')

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

