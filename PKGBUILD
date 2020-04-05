# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>

pkgname=zbom
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="The Legend of Zelda: Book of Mudora - A free 2D Zelda fangame"
arch=('any')
url="https://sites.google.com/site/zeldabom/"
license=('custom')
groups=()
depends=('solarus>=1.6.0')
makedepends=('gendesk' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/wrightmat/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('4092f25e35d0b78ad2d0bb2afc5eef45')
_name="The Legend of Zelda: Book of Mudora"
_categories="Game;AdventureGame"

prepare() {
  cd ${srcdir}
  gendesk -f -n ../PKGBUILD
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
  # Copy desktop file, icon and run script
  install -Dm0644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm0644 data/logos/logo.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
