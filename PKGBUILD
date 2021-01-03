# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=netlistviewer-svn
pkgver=r41
pkgrel=1
pkgdesc="a tool capable of loading netlists in text format (currently only SPICE netlists) and convert them in a schematic (i..e graphical) form"
arch=("x86_64")
url="https://sourceforge.net/projects/netlistviewer/"
license=('custom:unknown')
depends=('boost-libs' 'wxgtk2')
makedepends=('subversion' 'boost')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
source=("${pkgname%-svn}::svn+https://svn.code.sf.net/p/netlistviewer/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-svn}"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$srcdir/${pkgname%-svn}/NetlistViewer/build/linux"
  make all
}

package() {
  cd "$srcdir/${pkgname%-svn}/NetlistViewer/"
  install -Dm755 build/linux/NetlistViewer "$pkgdir/usr/bin/${pkgname%-svn}"
  install -dm755 "$pkgdir/usr/share/${pkgname%-svn}"; cp -r examples tests "$_/" 
}
