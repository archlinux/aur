pkgname=opendune
_pkgname=OpenDUNE
pkgver=0.9
pkgrel=2
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'alsa-lib' 'hicolor-icon-theme')
conflicts=('opendune-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenDUNE/OpenDUNE/archive/$pkgver.tar.gz")
sha256sums=('8d5ed67669df1f17a44c097d9b6bee4e0623ce2a37f11938ce9cd77de546d06c')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Version information. Need to build game
  echo "${pkgver}		0	${pkgver}" > .ottdrev
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix-dir=/usr --binary-dir=bin
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INSTALL_DIR="$pkgdir" install

  # install sample config and desktop file
  install -m644 bin/opendune.ini.sample "$pkgdir"/usr/share/doc/opendune
  install -Dm644 "../../$pkgname.desktop" "$pkgdir"/usr/share/applications/$pkgname.desktop
}

