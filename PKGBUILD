# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=crusta-browser-git
pkgver=1.4.3.1.r311.g6875afc
pkgrel=1
pkgdesc="Fast, secure, and free web browser built for the modern web."
arch=('i686' 'x86_64')
url="http://www.crustabrowser.com/"
license=('GPL3')
depends=('qt5-speech' 'qt5-webengine')
makedepends=('git' 'qt5-charts')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/CrustaBrowser/CrustaBrowser.git')
sha256sums=('SKIP')

pkgver() {
  cd CrustaBrowser
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd CrustaBrowser
  qmake
  make
}

package() {
  cd CrustaBrowser
  install -Dm755 Crusta "${pkgdir}/opt/${pkgname%-*}/crusta"
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/${pkgname%-*}/crusta" "$pkgdir/usr/bin/crusta"
}
