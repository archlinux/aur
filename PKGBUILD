# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext-hg
pkgver=r221.c9143bdbbd38
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://bitbucket.org/pitgarbe/textext"
provides=('textext')
conflicts=('textext')
depends=('inkscape' 'python2' 'texlive-core')
optdepends=('pygtk' 'python2-lxml' 'pdf2svg' 'pstoedit' 'ghostscript' 'imagemagick')
source=("textext::hg+https://bitbucket.org/pitgarbe/textext")
md5sums=('SKIP')

prepare() {
  cd  textext/textext-0.5-linux/extension
  sed -i '1s|python\>|python2|' typesetter.py
  sed -i '1s|python\>|python2|' textext.py
}

pkgver() {
  cd textext
  printf "r%s.%s" "$(hg identify -n|tr -d +)" "$(hg identify -i|tr -d +)"
}

package() {
  cd textext/textext-0.5-linux/extension
  install -d "$pkgdir"/usr/share/inkscape/extensions
  cp -r * "$pkgdir"/usr/share/inkscape/extensions
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}


