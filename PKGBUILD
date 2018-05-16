# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=0.7.3
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg' 'pygtk' 'imagemagick6')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tgz")
sha256sums=('5095d4bbbe4731d3edbff06fd82a48cf0c6c003a15147bede5bf11515c2e4fac')

prepare() {
  cd $pkgname-$pkgver-linux
  sed -i '1s|python\>|python2|' extension/textext.py
}

package() {
  cd $pkgname-$pkgver-linux/extension
  install -d "$pkgdir"/usr/share/inkscape/extensions
  for _i in asktext.py default_packages.tex latexlogparser.py textext.{inx,py} typesetter.py win_app_paths.py
  do install ${_i} "$pkgdir"/usr/share/inkscape/extensions/$_i
  done
  cd ..
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

