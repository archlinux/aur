#
# Touchégg : Multitouch gesture recogniser
#
# Original Maintainer: Guillaume Turchini <guillaume.turchini@gmail.com>"

_pkgname=touchegg
pkgname=${_pkgname}-git
pkgver=r508.f6c64bb
pkgrel=1
pkgdesc='Linux multi-touch gesture recognizer'
arch=('x86_64')
url='https://github.com/JoseExposito/touchegg'
license=('GPL3')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/JoseExposito/touchegg.git")
depends=('cairo' 'gtk3' 'pugixml' 'systemd-libs' 'libinput' 'libx11' 'libxrandr' 'libxtst')
makedepends=('cmake' 'git')
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${_pkgname}" -DCMAKE_BUILD_TYPE=Release ..
    make -C build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" make -C build install
}
