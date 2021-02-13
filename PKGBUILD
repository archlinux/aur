# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=svt-vp9-git
pkgver=0.3.0.r3.g10910b7
pkgrel=1
pkgdesc='Scalable Video Technology VP9 encoder (git version)'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-VP9/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'yasm')
provides=('svt-vp9')
conflicts=('svt-vp9')
source=('git+https://github.com/OpenVisualCloud/SVT-VP9.git')
sha256sums=('SKIP')

pkgver() {
    git -C SVT-VP9 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S SVT-VP9 \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 SVT-VP9/LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
}
