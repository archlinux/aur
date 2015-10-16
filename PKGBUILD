#Maintainer: M0Rf30

_pkgname=openbazaar-client
pkgname=${_pkgname}-git
pkgver=257.f5b8442
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar-Server daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(npm)
makedepends=(git)
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Client.git"
	"${_pkgname}.sh"
)
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})

build(){
  cd $srcdir/${_pkgname}
  npm install
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_pkgname} $pkgdir/opt/
  
 
msg2 "Installing execution script"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  

  rm -rf $pkgdir/opt/${_pkgname}/.git
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '70ef57608feaeeefd1cc6bb1b73bcc31')
