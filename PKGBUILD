# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

_pkgname=EonTimer
pkgname=eontimer-git
pkgver=2.0.1
pkgrel=1
pkgdesc='A Pokemon RNG timer'
arch=(x86_64)
url='https://github.com/dylmeadows/EonTimer'
license=('MIT')
depends=(
    'qt5-base'
    'sfml'
)
makedepends=(
    'git'
    'python'
    'python-qtsass'
)
conflicts=('eontimer')
provides=('eontimer')

source=("$pkgname-$pkgver::git+https://github.com/dylmeadows/EonTimer.git")
sha256sums=('SKIP')

prepare() {
    cd $pkgname-$pkgver
    python3 -m qtsass -o resources/styles resources/styles
}

build() {
    cmake \
        -B build \
        -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) \
        -Wno-dev

    make -C build
}

package() {
    install -Dm755 build/EonTimer "${pkgdir}/usr/bin/eontimer"
    install -Dm644 "$pkgname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
