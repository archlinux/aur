# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=gytparse
pkgver=0.1.0
pkgrel=1
arch=(any)
pkgdesc="Browse, stream and download Youtube videos"
license=(MPL2)
depends=(libadwaita python-gobject python-requests yt-dlp mpv)
optdepends=('python-pysocks: Browse and download through SOCKS5 proxies')
makedepends=(git meson gobject-introspection)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foucault/gytparse/archive/refs/tags/0.1.0.tar.gz")
_pyver=$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')
sha256sums=('5e2db560d47a59de93ee9faede223b616d1af9bf70c9881262c08bf990c9c846')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson . _build \
    -Dpython.purelibdir=/usr/lib/python${_pyver} \
    -Dpython.platlibdir=/usr/lib/python${_pyver} \
    -Dprefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson install -C _build --destdir "$pkgdir"
}
