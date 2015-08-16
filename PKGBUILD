# Contributor: boteium
pkgname=transmission-remote-gui-svn
pkgver=978
pkgrel=1
url="http://code.google.com/p/transmisson-remote-gui/"
pkgdesc="A feature rich cross platform front-end to remotely control Transmission daemon. (gtk2)"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('lazarus' 'subversion')
conflicts=('transmission-remote-gui-gtk2' 'transmission-remote-gui')
source=()
md5sums=()
_svntrunk="http://transmisson-remote-gui.googlecode.com/svn/trunk"
_svnrev="HEAD"
_svnmod="transmission-remote-gui-read-only"

build() { 

cd $srcdir 
mkdir -p ~/.subversion

svn co $_svntrunk -r $_svnrev $_svnmod
msg "SVN checkout done or server timeout"

cd $srcdir/$_svnmod

msg "Starting compile.."
lazbuild transgui.lpi --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --primary-config-path=${srcdir}/config

}

package(){

  cd $srcdir/$_svnmod

  install -D -m755 "$srcdir/$_svnmod/units/transgui" "$pkgdir/usr/bin/transgui"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lang
  install -D -m 644 lang/transgui.* ${pkgdir}/usr/share/${_pkgname}/lang
}
