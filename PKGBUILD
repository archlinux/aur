# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=gytparse
pkgver=0.1.1
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
sha256sums=('329c9ea71d398ec823ba5c5052f922d0754b2d7f0e337e596380d172e46bf4e7')

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
