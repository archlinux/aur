#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=3849.cec8e4b
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron037)
makedepends=(git npm)
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Client.git"
	"${_pkgname}.sh"
        "${_pkgname}.desktop"
)
install=${_pkgname}.install
options=('!strip')
provides=('openbazaar')
conflicts=('openbazaar')

build(){
  cd $srcdir/${_pkgname}
  npm install --production
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_pkgname} $pkgdir/opt/

msg2 "Installing execution script"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}

  rm -rf $pkgdir/opt/${_pkgname}/{.git*,.eslint*,.travis*}

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $srcdir/${_pkgname}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/openbazaar.png
  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir"/usr/share/applications/openbazaar.desktop
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '29c1b2adff85a66160fdaa0b48174c03'
         'dbca9273e9fc18a7aa5d1c395508fe60')
