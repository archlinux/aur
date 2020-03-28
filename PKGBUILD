# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=0.11.1
pkgrel=1
pkgdesc="A better transparent encryption filesystem"
arch=('i686' 'x86_64')
url=https://github.com/netheril96/securefs
license=('MIT')
depends=('fuse' 'gcc-libs')
makedepends=('cmake' 'git')
source=("git+${url}.git#tag=${pkgver}" "git+https://github.com/JuliaStrings/utf8proc.git")
sha256sums=('SKIP'
            'SKIP')

build() {
    mv utf8proc securefs/external/
    cd "$pkgname"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -Dlibdir=/usr/lib ..
    make
}

package() {
    cd "$pkgname"
    install -Dm755 build/securefs "$pkgdir"/usr/bin/securefs
    install -Dm755 build/securefs_test "$pkgdir"/usr/bin/securefs_test
    install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
