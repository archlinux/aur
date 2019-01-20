# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext-git
pkgver=0.9.0.8.g0a4b388
epoch=1
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext.git"
provides=('textext')
conflicts=('textext')
makedepends=('mercurial')
depends=('inkscape' 'python2' 'texlive-core')
optdepends=('pygtk' 'python2-lxml' 'pdf2svg' 'pstoedit' 'ghostscript' 'imagemagick6')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |tr - .
}

package() {
  install -d "$pkgdir"/usr/share/inkscape/extensions
  cd ${pkgname%-git}/extension
  cp -r ${pkgname%-git} "$pkgdir"/usr/share/inkscape/extensions
  install -m644 ${pkgname%-git}.inx "$pkgdir"/usr/share/inkscape/extensions/
  cd ..
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd "$pkgdir"/usr/share/inkscape/extensions/${pkgname%-git}
  sed -i '1s+\#!/usr/bin/env python+\#!/usr/bin/env python2+' __init__.py typesetter.py
}



