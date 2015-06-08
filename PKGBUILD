# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=cinnamon-bluetooth
pkgname=${_pkgname}-git
pkgver=7.5eed305
pkgrel=1
epoch=1
pkgdesc="The Cinnamon Bluetooth Module"
arch=(i686 x86_64)
url="https://github.com/linuxmint/cinnamon-bluetooth"
license=(GPL)
depends=('gtk3' 'cinnamon-control-center' 'gnome-bluetooth')
makedepends=('gnome-common' 'git')
options=(!emptydirs)
install=cinnamon-bluetooth.install
source=("${_pkgname}"::git+https://github.com/linuxmint/cinnamon-bluetooth.git)

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_pkgname}
  
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var 

  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
