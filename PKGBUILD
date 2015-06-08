# Maintainer: JSH <jsh6789 at gmail dot com>

pkgname=apoo
pkgver=2.2
pkgrel=2
pkgdesc="An environment for a first course in assembly language programming"
arch=('any')
url="http://www.ncc.up.pt/Apoo/"
license=('GPL')
depends=('pygtk>=2.10' 'desktop-file-utils')
makedepends=('gendesk')
options=(!emptydirs)
install=apoo.install
source=("http://http.debian.net/debian/pool/main/a/apoo/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('d27455bbefe361d53c95ba9d746f52a6')
_categories="Education;Science;ComputerScience;"

prepare() {

  gendesk
  
  cd "$pkgname-$pkgver"

# python2 fix
  sed -i 's|/usr/bin/python|/usr/bin/python2|g' apoo *.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install program
  install -Dm755 apoo "$pkgdir/usr/bin/apoo"
  for _file in *.py; do \
    install -Dm755 "$_file" "$pkgdir/usr/lib/$pkgname/$_file"
  done
  
  # Install documentation
  cd docs
  for _file in *; do \
    install -Dm644 "$_file" "$pkgdir/usr/share/doc/$pkgname/$_file"
  done
  
  cd ../html
  for _file in *; do \
    install -Dm644 "$_file" "$pkgdir/usr/share/doc/$pkgname/html/$_file"
  done
  
  cd ../examples
  for _file in *; do \
    install -Dm644 "$_file" "$pkgdir/usr/share/doc/$pkgname/examples/$_file"
  done
  
  # Install .desktop
  cd "$srcdir"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
