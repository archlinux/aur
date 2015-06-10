# Maintainer: Jure Varlec <jure.varlec@ad-vega.si>
pkgname=qarv
pkgver=2.0.0
pkgrel=2
pkgdesc="Qt GUI and API interfaces to ethernet cameras via Aravis"
arch=( i686 x86_64 )
url="https://gitorious.org/adv/${pkgname}"
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
source=( "http://software.ad-vega.si/$pkgname/$pkgname-$pkgver.tar.xz" )
noextract=()
md5sums=( '23bc48cf980ced64a199c9874f21c7a1' )

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
