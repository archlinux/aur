# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.4.7
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://guayadeque.org/"
license=(GPL3)
depends=(wxsqlite3 wxwidgets-gtk3 webkit2gtk taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz"
        "https://github.com/sluedecke/guayadeque/commit/a9ecb9d8bf785281ed8ccf292cccf3525ffeb457.patch")
sha256sums=('38d6ab8a1820e8c205b8f07d86fee912263dfdb982f5c08086e897600e0771b2'
            '046883477c149fb78668285cbd7293be343adc3010631ff55ab2eae2dc2d12e0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d build-guayadeque
  patch -Np1 -i ../a9ecb9d8bf785281ed8ccf292cccf3525ffeb457.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build-guayadeque"
  cmake .. \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -D_GUREVISION_:STRING="${pkgrel}" \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build-guayadeque"
  make DESTDIR="${pkgdir}" install
}
