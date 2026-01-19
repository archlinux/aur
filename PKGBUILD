# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.7.1
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts (like zenity but written in zig)"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/r4gus/${_Name}"
license=('MIT')
depends=()
makedepends=('zig>=0.15.0' 'zig<0.16.0')
_pkgsrc="${_Name}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('3e694f96d2002b6f9aac4e3b6eff47b57485d76152402c6f8e3c8f3b15b8aa4a5de484fc8dbf729ca94a5609502cfa4ed58af34e3b0555286c0478261c19500d')
 
build() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "${srcdir}/zig-global-cache" \
    --verbose \
    -Doptimize=ReleaseSmall
}

package() {
  cd "${_pkgsrc}"
  cp -va build/* "${pkgdir}"
}
