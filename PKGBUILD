# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.8.0
pkgrel=0
pkgdesc="Display graphical dialog boxes from shell scripts (like zenity but written in zig)"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/r4gus/${_Name}"
license=('MIT')
depends=()
makedepends=('zig>=0.15.0')
_pkgsrc="${_Name}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('7b77bd237d94d47d1441b3eca093fafb438e9e68649d00156b5b057380389571cb864f5bb8a63756b53b7d64f8933ce6eb5e908ad9eb133e3642efd5b9217cb7')
 
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
