#Maintainer: M0Rf30

pkgname=openbazaar
pkgver=1.1.3
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(npm)
source=(
	"https://github.com/OpenBazaar/OpenBazaar-Client/archive/v$pkgver.tar.gz"
	"$pkgname.sh"
        "$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')
provides=('openbazaar')
replaces=('openbazaar-git')
_srcfolder=OpenBazaar-Client-$pkgver

build(){
  cd $srcdir/${_srcfolder}
  npm install --production
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_srcfolder} $pkgdir/opt/openbazaar

msg2 "Symlinking to allow gui to automatically call daemon"
  ln -sr /var/lib/openbazaard $pkgdir/opt/OpenBazaar-Server

msg2 "Installing execution script"
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

  rm -rf $pkgdir/opt/$pkgname/{.git*,.eslint*,.travis*}

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $srcdir/${_srcfolder}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/openbazaar.png
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir"/usr/share/applications/openbazaar.desktop
}

md5sums=('96f02af324485a68a6b8e04f2e734914'
         '2f915aa854435ce7cd1dfca4eccd0112'
         'dbca9273e9fc18a7aa5d1c395508fe60')
