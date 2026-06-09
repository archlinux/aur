# Maintainer: Moriaan Michiels <moriaan.michiels@gmail.com>
pkgname=jcd-git
pkgver=v1.0.1.r0.g7868b78
pkgrel=1
pkgdesc="Fuzzy cd alternative (Git version)"
arch=('x86_64')
url="https://github.com/MnM72809/jcd"
license=('MIT')
provides=('jcd' 'jcd-debug')
conflicts=('jcd' 'jcd-debug')

makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/MnM72809/jcd.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 "${srcdir}/build/jcd" "${pkgdir}/usr/bin/jcd"
}
