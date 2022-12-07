# Maintainer: Valentino Orlandi <valentinox@disroot.org>

_gitname='LogDoctor'
pkgname='logdoctor'
pkgver='2.01'
pkgrel='1'
pkgdesc="Apache2/Nginx/IIS access logs analyzer to view dynamically generated statistics"
arch=('x86_64')
url='https://github.com/elB4RTO/LogDoctor'
license=('AGPL3')
depends=('qt5-base' 'qt5-charts' 'zlib')
makedepends=('cmake' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/elB4RTO/LogDoctor/archive/refs/tags/v2.01.tar.gz")
noextract=()
sha256sums=('60704fe5bf970e2afc22e4353a5e45b6f679898ec558fe94aa366c1fb00970e4')
validpgpkeys=('EF88B042FB649B22A9F19DBE1719E976DB2D4E71')


build() {
  cd "$_gitname-$pkgver"

  test -e build && rm -r build
  mkdir build && cd build

  cmake --fresh ../logdoctor -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake --build ./ --target all

  mv "$_gitname" "$pkgname"
}


package() {
  cd "$_gitname-$pkgver"

  install -DC -m 755 "./build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -DC -m 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  cd installation_stuff
  install -DC -m 644 ./LogDoctor.svg -t "$pkgdir/usr/share/LogDoctor"
  install -DC -m 644 ./logdocdata/help/en/* -t "$pkgdir/usr/share/LogDoctor/help/en"
  install -DC -m 444 ./logdocdata/licenses/* -t "$pkgdir/usr/share/LogDoctor/licenses"
  install -DC -m 644 ./LogDoctor.desktop -t "$pkgdir/usr/share/applications"
}
