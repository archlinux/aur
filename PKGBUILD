# Mantainer: David Rubio Escares (david.alejandro.rubio at gmail dot com)

pkgname=kwin-effects-yet-another-magic-lamp-git
_pkgname=kwin-effects-yet-another-magic-lamp
pkgver=4.1.2.r0.g1e38dd1
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect. (Git version)"
arch=('x86_64')
url="https://github.com/zzag/$_pkgname"
license=('GPL3')
makedepends=(extra-cmake-modules)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(kwin)
source=($pkgname::git+https://github.com/zzag/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
    mkdir -p build
    cd build
    cmake ../"$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
