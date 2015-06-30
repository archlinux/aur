# Maintainer: Jasper Follas <follasjj@live.co.uk>

pkgname=zennode
pkgver=1.2.1
pkgrel=8
pkgdesc="A node builder for Doom WAD files"
arch=('i686' 'x86_64')
url="http://www.mrousseau.org/programs/ZenNode"
license=('GPL3')
makedepends=('unzip')
source=(http://www.mrousseau.org/programs/ZenNode/archives/$pkgname-$pkgver.zip \
        makefile.diff \
        compare.diff)
md5sums=('36d5082b48ef1e4f638a38ba1034d058'
         '6662c600aa37f1fbd3184f360726f960'
         'da184744ea4b386324abd3aef3c1cb8b')

build() {

  cd "$srcdir/ZenNode-$pkgver"
  
  bsdtar -xf "$pkgname-src.zip"
  cd "src/ZenNode"

  msg2 "Applying patches"
  patch -N --verbose makefile "$srcdir/makefile.diff"
  patch -N --verbose compare.cpp "$srcdir/compare.diff"
  
  msg2 "Compiling"
  make -i
  msg "Compilation finished"
}

package() {
  install -m755 -d "$pkgdir/usr/bin/"
  install -m755 "$srcdir/ZenNode-$pkgver/src/ZenNode/bspdiff" "$pkgdir/usr/bin/"
  install -m755 "$srcdir/ZenNode-$pkgver/src/ZenNode/bspinfo" "$pkgdir/usr/bin/"
  msg2 "Installing ”compare” binary as ”bspcomp”"
  install -m755 "$srcdir/ZenNode-$pkgver/src/ZenNode/compare" "$pkgdir/usr/bin/bspcomp"
  install -m755 "$srcdir/ZenNode-$pkgver/src/ZenNode/ZenNode" "$pkgdir/usr/bin/ZenNode"
  ln -s /usr/bin/ZenNode "$pkgdir/usr/bin/zennode"
  msg2 "Installing ”ZenNode” binary ALSO as ”zennode”"
}
