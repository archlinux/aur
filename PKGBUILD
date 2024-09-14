# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.6.0
pkgrel=2
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo' 'libarchive' 'libspnav' 'cppzmq')
makedepends=('meson' 'cmake' 'glm' 'python3')
source=(
  "https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz"
  "0001-meson.build-test-opencascade-with-as-needed.patch"
)
sha256sums=(
  'e7e680a05b92ac8ab4b6a32fb8e3b17bc298245d3d3d9224e9b3f7fb55b81256'
  'e9cdda326c3329f7f29c6ec53b49d7ef980700be2b6dac8049ed84994ea3c5a4'
)

prepare() {
   cd horizon-$pkgver
   patch -Np1 -i ../0001-meson.build-test-opencascade-with-as-needed.patch
}

build() {
  cd horizon-$pkgver
  arch-meson build

  meson compile -C build
}

package() {
    cd horizon-$pkgver
    meson install -C build --destdir "$pkgdir"
}
