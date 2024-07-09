# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgname=anime4kcpp-git
pkgver=v2.5.0.r416.g2578b7b
pkgrel=2
pkgdesc="A high performance anime upscaler"
arch=("x86_64")
url="https://github.com/TianZerL/Anime4KCPP"
license=('MIT')
depends=('opencv' 'ocl-icd' 'vtk')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "${pkgname%-git}::git+https://github.com/TianZerL/Anime4KCPP.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"

    mkdir -p build && cd build
    cmake ..
    cmake --build . --config Release -j8
}

package() {
    cd "${pkgname%-git}"

    install -Dm755 "build/bin/ac_cli" "$pkgdir/usr/bin/ac_cli"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
