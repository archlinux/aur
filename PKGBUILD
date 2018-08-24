# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=0.8.1
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg' 'pygtk' 'imagemagick6')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tgz")
sha256sums=('9420b59f92fe6833e14da11f8986f268d5546b565a885e497b965e89ad1f0586')

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

