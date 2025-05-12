# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.5.0
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
b2sums=('123fd528d5ad3e23d45fd23d4f5691a9b61341c66f2a1f22c6a1f7c9b47e063c5ecf988e94ce58ab6274edf14f13950613dff65584fe0842a49d9ba515b4668e')
 
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
