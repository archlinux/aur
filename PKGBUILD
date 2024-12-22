# Maintainer: Mykhailo Muzyka <mykhailo.muzyka535@gmail.com>

_tag=a626aa7034fdf9a2ee6f64595b4a024ef59f7314
_source="kastel"

pkgname="kastel-git"
pkgver="0.3"
pkgrel=1
pkgdesc="KDE Plasma 6 KRunner pastel plugin"
arch=("any")
url="https://github.com/Mykhail024/kastel"
license=("GPL-3.0")
makedepends=("git")
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("kastel")
source=("git+${url}.git#tag=${_tag}?signed")
md5sums=("SKIP")
validpgpkeys=(F194BF0887787571E9460B945BC1D32B8849594A)

pkgver() {
    cd "${_source}"
    git describe --tags | sed 's/^v//'
}

prepare() {
  mkdir "${_source}/build"
  cmake -S ${_source} -B  "${_source}/build" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  make -C "${_source}/build"
}

package() {
    make DESTDIR="${pkgdir}" -C "${_source}/build" install
    install -Dm 644 "${_source}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

clean() {
    rm -rf "${_source}/build"
}
