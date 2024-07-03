# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: supdrewin <supdrewin at outlook dot com>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>


pkgname=linux-enable-ir-emitter-5.2.4
_gittag=5.2.4
pkgver=5.2.4.r0.g5efaae8
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git meson)
depends=(python opencv fmt)

install=linux-enable-ir-emitter.install

source=("${pkgname}::git+${url}.git#tag=${_gittag}")
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
