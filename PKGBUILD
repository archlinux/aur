# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.4.3
pkgrel=1
pkgdesc='Lightweight music player'
arch=('i686' 'x86_64')
url='http://guayadeque.org/'
license=('GPL3')
depends=('curl' 'libgpod' 'taglib' 'wxsqlite3' 'gst-plugins-base')
makedepends=('cmake')
optdepends=('gst-plugins-good: Support for PulseAudio and additional file formats'
            'gst-plugins-bad: Support for additional file formats'
            'gst-plugins-ugly: Support for additional file formats'
            'gst-libav: Support for additional file formats'
            'gvfs: Support for external devices')
source=("https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz")
sha256sums=('43d925c6dc30c1f9e2e8182b10de6a9076d962877779f6b9e0194d1ee79a07d8')

_BUILDFLDR='localbuild'

build() {
  cd ${pkgname}-${pkgver}

  ./buildt
  mkdir -p ${_BUILDFLDR} && cd ${_BUILDFLDR}

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -D_GUREVISION_:STRING="${pkgrel}"
  make
}

package() {
  cd ${pkgname}-${pkgver}/${_BUILDFLDR}

  make DESTDIR="${pkgdir}" install
}
