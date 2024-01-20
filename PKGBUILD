# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=boca
_pkgname=BoCA
pkgver=1.0.7
pkgrel=1
epoch=1
pkgdesc="A component library used by the fre:ac audio converter"
arch=('x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'expat' 'libcdio-paranoia' 'libpulse' 'smooth' 'uriparser')
provides=('libboca-1.0.so=3' 'freac_cdk')
conflicts=('freac_cdk')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c0b99b377e5bc5aeb046e34e25f8bc8af6427af30bf3105dd4318ed228a6a0f')

prepare() {
  cd "$_pkgname-$pkgver"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  sed -i 's/FOLDERS += coreaudioconnect/#FOLDERS += coreaudioconnect/g' \
    components/encoder/Makefile
}

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
