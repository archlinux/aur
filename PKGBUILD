# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.4.1
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts (like zenity but written in zig)"
arch=('aarch64' 'x86_64')
url="https://github.com/r4gus/${_Name}"
license=('MIT')
depends=()
makedepends=('zig>=0.14.0' 'zig<0.15.0')
_pkgsrc="${_Name}-${pkgver}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('73046d2202609b333cf85438bcefa46932f7ede83bda60343dc5fadb04afb8af6d803a464e52b64814ece7fcf7c022231b183629b174453691389457724248e6')
 
build() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "${srcdir}/zig-global-cache" \
    --verbose \
    -Doptimize=ReleaseSafe
}

package() {
  cd "${_pkgsrc}"
  cp -va build/* "${pkgdir}"
}
