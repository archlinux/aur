# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jackmix-git
_pkgname=jackmix
pkgver=r323.bc11af8
pkgrel=2
pkgdesc="Matrix-mixer for JACK"
arch=('i686' 'x86_64')
url="https://github.com/kampfschlaefer/jackmix"
license=('GPL2')
depends=('qt5-base' 'jack' 'ladish')
makedepends=('gendesk')
conflicts=('jackmix')
source=("${_pkgname}"::'git+https://github.com/kampfschlaefer/jackmix.git#branch=qt5')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  gendesk -f -n --pkgname "$_pkgname" --exec "$_pkgname" --pkgdesc "$pkgdesc" --categories 'Audio;Mixer'
}

build() {
  cd "$srcdir/${_pkgname}"
  scons
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 jackmix/jackmix $pkgdir/usr/bin/jackmix
  install -Dm644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}
