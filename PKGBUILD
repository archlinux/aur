# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>

# TODO: move libs to lib32 ?
# User lib32-gtk2 properly

pkgname=netfabb-basic
pkgver=5.0.0
pkgrel=1
pkgdesc="view and repair STL files"
arch=('i686' 'x86_64')
url="http://www.netfabb.com/download.php"
license=('custom:freeware')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
install='netfabb-basic.install'
source=("netfabb-basic_${pkgver}_linux32.tar.gz::http://www.netfabb.com/download.php?pikey=WuHOZzhsQZUjHAT")
md5sums=('8f59b70fae694148d1915560e0e4de99')

if [ "$CARCH" == x86_64 ] ; then
#  source=('http://www.netfabb.com/download/netfabb_linux64.tar.gz')
#  md5sums=('36577e34a3b51742c3ace44cfd15d794')
   depends[0]="lib32-gtk2"
fi

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -E "/(echo)/!s#/usr#$pkgdir/usr#" install.sh
  sed -i "/echo/ s#>/usr/bin/netfabb-basic#>$pkgdir/usr/bin/netfabb-basic#" install.sh
  sed -i '/uninstall/d' install.sh
}

package () {
  cd "$srcdir/$pkgname"
  ./install.sh
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
}
