# Maintainer: condy <condy0919 at gmail dot com>
pkgname=moros-git
pkgver=r45.6e12809
pkgrel=1
pkgdesc='a http(s) benchmark tool'
arch=('any')
url='https://github.com/condy0919/moros'
license=('MIT')
depends=('boost')
makedepends=('git' 'cmake' 'make' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}"::'git+https://github.com/condy0919/moros.git')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"

    # fetch third libraries
    git submodule update --init --recursive

    # build
    cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 "bin/moros" "$pkgdir/usr/bin/moros"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/moros/LICENSE"
}
