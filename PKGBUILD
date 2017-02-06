# Maintainer: M0Rf30

pkgname=openbazaar
pkgver=1.1.11
pkgrel=2
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(npm asar)
source=(
	"https://github.com/OpenBazaar/OpenBazaar-Client/archive/v$pkgver.tar.gz"
	"$pkgname.sh"
        "$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')
provides=('openbazaar')
_srcfolder=OpenBazaar-Client-$pkgver

build(){
  cd $srcdir/${_srcfolder}
  npm install --production
  rm -rf {.git*,.eslint*,.travis*}
  asar pack ../${_srcfolder} ../${pkgname}.asar
}

package(){
  cd $srcdir

msg2 "Installing Openbazaar data"
  install -Dm644 $pkgname.asar $pkgdir/opt/$pkgname.asar

msg2 "Installing execution script"
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname

  rm -rf $pkgdir/opt/$pkgname/{.git*,.eslint*,.travis*}

msg2 "Installing icons and desktop menu entry"
  install -Dm644 ${_srcfolder}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/openbazaar.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/openbazaar.desktop
}

md5sums=('0cdf4a51f47a49d71846261cd36a0e00'
         '978f2bc37d379c6ccd8c5942ef44612c'
         'dbca9273e9fc18a7aa5d1c395508fe60')
