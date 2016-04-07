#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=2961.b50743c
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(git npm)
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Client.git"
	"${_pkgname}.sh"
        "${_pkgname}.desktop"
)
install=${_pkgname}.install
options=('!strip')
provides=('openbazaar')
replaces=('openbazaar')

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
         '2f915aa854435ce7cd1dfca4eccd0112'
         'dbca9273e9fc18a7aa5d1c395508fe60')
