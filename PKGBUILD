# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=gytparse
pkgver=0.1.1
pkgrel=3
arch=(any)
url='https://github.com/foucault/gytparse'
pkgdesc="Browse, stream and download Youtube videos"
license=(MPL2)
depends=(libadwaita python-gobject python-requests yt-dlp mpv)
optdepends=('python-pysocks: Browse and download through SOCKS5 proxies')
makedepends=(git meson gobject-introspection)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foucault/gytparse/archive/refs/tags/${pkgver}.tar.gz")
_pyver=$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')
sha256sums=('c0486d9aa2ca4e3c9ee74be1120231c0267a7a9c57ff267ed98aa6781228d863')

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
