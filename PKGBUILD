# Maintainer: Robert Manner <the_manni at users.sf.net>

_Name="zigenity"
pkgname="${_Name,,}"
pkgver=0.9.0
pkgrel=0
pkgdesc="Display graphical dialog boxes from shell scripts (like zenity but written in zig)"
arch=('aarch64' 'x86_64')
url="https://codeberg.org/r4gus/${_Name}"
license=('MIT')
depends=()
makedepends=('zig>=0.17.0')
_pkgsrc="${_Name}"
noextract=()
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('a9c181639973a1c5ef5f5992dcf42c22fdfa1609fc3ea7f6945d3185cffdd400616027061dc45df3377cdac9f1bfd9915041ebb530c266fa1fde28b9c5f3e76c')
 
build() {
  cd "${srcdir}/${_pkgsrc}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --verbose \
    -Doptimize=ReleaseSmall
}

package() {
  cd "${_pkgsrc}"
  cp -va build/* "${pkgdir}"
}
