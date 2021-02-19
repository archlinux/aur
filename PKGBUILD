# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-gst-editing-services
pkgver=1.18.3
pkgrel=1
pkgdesc="GStreamer editing services (mingw-w64)"
arch=(any)
url="http://gstreamer.freedesktop.org/"
license=('LGPL')
depends=('mingw-w64-gst-plugins-base')
makedepends=('mingw-w64-meson')
options=('!strip' '!buildflags' 'staticlibs')

source=("${url}src/gst-editing-services/gst-editing-services-${pkgver}.tar.xz")
sha256sums=('8ae139b13b1646a20ba63b0b90877d35813e24cd87642d325e751fc7cb175e20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gst-editing-services-${pkgver}"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D gtk_doc=disabled ..
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/gst-editing-services-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/gst-editing-services-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
