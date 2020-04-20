# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=crusta-browser-git
pkgver=r54.3e9989f
pkgrel=1
pkgdesc="Fast, secure, and free web browser built for the modern web."
arch=('i686' 'x86_64')
url="http://www.crustabrowser.com/"
license=('GPL3')
depends=('qt5-speech' 'qt5-webengine')
makedepends=('git' 'qt5-charts' 'cmake' )
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/Tarptaeya/Crusta.git')
sha256sums=('SKIP')

pkgver() {
  cd Crusta
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -rf "Crusta/build"
	mkdir "Crusta/build"
	cd "Crusta/build"
	cmake \
			..
  make
}

package() {
  cd Crusta/build
  install -d "$pkgdir/usr/bin"
  install -Dm755 crusta "${pkgdir}/usr/lib/Crusta/crusta"
  install -Dm755 adblock "${pkgdir}/usr/lib/Crusta/adblock"
  install -Dm755 libcrusta-private.so "${pkgdir}/usr/lib/Crusta/libcrusta-private.so"
  ln -sf "/usr/lib/Crusta/crusta" "$pkgdir/usr/bin/crusta"
}
