# Maintainer: agony <27015 at riseup dot net>
pkgname=kio-s3
pkgver=r359.8c62883
pkgrel=1
pkgdesc="KIO worker for Amazon S3"
arch=('x86_64')
url="https://invent.kde.org/network/kio-s3"
license=('BSD-3-Clause' 'CC0-1.0' 'GPL-2.0-or-later')
depends=('kio' 'ki18n' 'aws-sdk-cpp' 'kirigami-addons')
makedepends=('git' 'extra-cmake-modules' 'cmake' 'kdoctools' 'kcmutils')
source=("git+https://invent.kde.org/network/kio-s3.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
