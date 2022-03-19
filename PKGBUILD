# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=gytparse
pkgver=0.1.2
pkgrel=1
arch=(any)
url='https://github.com/foucault/gytparse'
pkgdesc="Browse, stream and download Youtube videos"
license=(MPL2)
depends=(libadwaita python-gobject python-requests yt-dlp mpv)
optdepends=('python-pysocks: Browse and download through SOCKS5 proxies')
makedepends=(git meson gobject-introspection)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foucault/gytparse/archive/refs/tags/${pkgver}.tar.gz")
_pyver=$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')
sha256sums=('1c0d0e1f6f58d366ee7900fca9a07c20570b08948c2d68cf4fae63f7f3a2304e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson . _build \
    -Dpython.purelibdir=/usr/lib/python${_pyver}/site-packages \
    -Dpython.platlibdir=/usr/lib/python${_pyver}/site-packages \
    -Dprefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson install -C _build --destdir "$pkgdir"
}
