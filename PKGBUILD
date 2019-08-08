# ---------------------------------------------------------------
# Maintainer: Marius Mo <aur at 2mo dot pw>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-oesenc
pkgver=3.0.0
pkgrel=1
pkgdesc="oeSENC Plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/oesenc.html"
source=("https://github.com/bdbcat/oesenc_pi/archive/v${pkgver}.tar.gz" "CMakeLists.txt.patch")
sha1sums=('95941113b64253d758d99a8ebecd2fb02119a309'
          '08a26936c63640b9a30d334b024bb0dd11bd2832')

prepare() {
  cd "oesenc_pi-${pkgver}"
  patch  --forward --strip=1 --input="${srcdir}/CMakeLists.txt.patch"
}

build() {
  cd "oesenc_pi-${pkgver}"
  mkdir -p build
  cd build
  cmake -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "oesenc_pi-${pkgver}/build"
  DESTDIR="$pkgdir" make install
}

