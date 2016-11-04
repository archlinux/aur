# Maintainer: M0Rf30

pkgname=openbazaar
pkgver=1.1.9
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron037)
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

md5sums=('83685902cf84ab3333fa310bc9afa995'
         'fef50202071cadef76388117ffc0c750'
         'dbca9273e9fc18a7aa5d1c395508fe60')
