# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext-hg
pkgver=r284.6494b1bc7e9b
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
  cd  textext/
  sed -i '1s|python\>|python2|' *.py
}

pkgver() {
  cd textext
  printf "r%s.%s" "$(hg identify -n|tr -d +)" "$(hg identify -i|tr -d +)"
}

package() {
  cd textext/
  install -d "$pkgdir"/usr/share/inkscape/extensions
  for _i in asktext.py default_packages.tex latexlogparser.py textext.{inx,py} typesetter.py
  do install ${_i} "$pkgdir"/usr/share/inkscape/extensions/$_i
  done
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}


