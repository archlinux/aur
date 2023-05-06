# Maintainer: taotieren <admin@taotieren.com>

pkgname=idl-serial-git
pkgver=908c364
pkgrel=1
pkgdesc="This project is a IDL serial generator for c. We use flex && bison to scan and parse files and generate json to struct and struct to json code."
arch=('any')
url="https://github.com/nanomq/idl-serial"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=()
makedepends=(git
            cmake
            ninja)
backup=()
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
#     git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DNNG_ENABLE_TLS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    DESTDIR="${pkgdir}" ninja -C build install
}
