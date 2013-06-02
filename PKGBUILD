# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>

pkgname=netfabb-basic
pkgver=4.9.5
pkgrel=0
pkgdesc="view and repair STL files"
arch=('i686' 'x86_64')
url="http://www.netfabb.com/download.php"
license=('fix_namcap')
depends=('gtk2' 'gcc-libs' 'desktop-file-utils' 'hicolor-icon-theme')
#optdepends=('')
#provides=('slic3r')
#conflicts=('slic3r')
#Consider uncommenting line below in case of false negative test results ;)
#BUILDENV+=('!check')
source=('http://www.netfabb.com/download/netfabb_linux.tar.gz')
md5sums=('SKIP')

if test "$CARCH" == x86_64; then
  source=('http://www.netfabb.com/download/netfabb_linux64.tar.gz')
  md5sums=('36577e34a3b51742c3ace44cfd15d794')
fi

prepare() {
  cd "$srcdir/$pkgname"
  # sed /usr to $pkgdir/usr in install.sh, TODO: if echo then only after last > / if echo then only last match in line
  sed -i "s#/usr#$pkgdir/usr#" install.sh
  #sed "/echo/ s=>>/usr=>>$pkgdir/usr="
  # remove uninstall.sh lines from install.sh
  sed -i '/uninstall/d' install.sh
  # do sth with license/readme/changelog files?
  bash -i || true
  sleep 3
}

package () {
  cd "$srcdir/$pkgname"
  ./install.sh
}

