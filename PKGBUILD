# Maintaener: supdrewin <supdrewin at outlook dot com>
# Co-Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Liao Junxuan <mikeljx@126.com>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>

pkgname=linux-enable-ir-emitter-git
pkgver=6.0.0.r1.g7558eae
pkgrel=2
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git meson argparse qt6-base zlib)
depends=(python opencv fmt gtk3 yaml-cpp spdlog)

install=linux-enable-ir-emitter.install

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    meson setup build
    meson compile -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    meson install -C build --destdir=${pkgdir}
}
