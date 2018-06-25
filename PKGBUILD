# Maintainer: Jure Varlec <jure.varlec@ad-vega.si>
pkgname=qarv
pkgver=2.1.0
pkgrel=1
pkgdesc="Qt GUI and API interfaces to ethernet cameras via Aravis"
arch=( i686 x86_64 )
url="https://github.com/AD-Vega/${pkgname}"
license=('GPL3')
depends=( qt4 aravis ffmpeg opencv gstreamer )
makedepends=( cmake doxygen graphviz )
checkdepends=()
optdepends=()
provides=( ${pkgname} )
conflicts=( ${pkgname}-git )
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/AD-Vega/${pkgname}/archive/${pkgver}.tar.gz" )
noextract=()
md5sums=( 'c2ec45d07a9ccee295c19c0d2be0b3fd' )

build() {
  cd $srcdir
  [ -d build ] && rm -r build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ "$srcdir/$pkgname-$pkgver/"
  make doc
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  local docdest="$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$docdest"
  cp "$srcdir/$pkgname-$pkgver/"{README,NEWS,AUTHORS} "$docdest"
  cp -r apidoc/html "$docdest/api"
}

# vim:set ts=2 sw=2 et:
