# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=armips-git
pkgver=0.11.0.r79.g2c803b6
pkgrel=1
epoch=1
pkgdesc='An assembler for various ARM and MIPS platforms'
arch=('x86_64')
url='https://github.com/Kingcom/armips'
license=('MIT')
makedepends=('git' 'cmake')
depends=('gcc-libs')
provides=('armips')
conflicts=('armips')
source=('git+https://github.com/Kingcom/armips')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/armips
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$srcdir"/armips
    mkdir -p build
}

build() {
    cd "$srcdir"/armips/build
    cmake -DCMAKE_BUILD_TYPE=Release -DARMIPS_USE_STD_FILESYSTEM=ON -DARMIPS_PRECOMPILE_HEADERS=ON ..
    make armips-bin
}

package() {
    cd "$srcdir"/armips
    install -Dm755 build/armips "$pkgdir"/usr/bin/armips
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
