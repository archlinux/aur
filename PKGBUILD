# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.6.0
pkgrel=2
pkgdesc="Display graphical dialog boxes from shell scripts (like zenity but written in zig)"
arch=('aarch64' 'x86_64')
url="https://github.com/r4gus/${_Name}"
license=('MIT')
depends=()
makedepends=('zig>=0.15.0' 'zig<0.16.0')
_pkgsrc="${_Name}-${pkgver}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f04d23ab432830e02adc25315ef16b246ada3f86a6217da718667bd340e9e07d97f9e03854a5c8557c5539267811652507536099a8ca574a4aacb46790f69488')
 
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
