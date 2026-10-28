# Maintainer: agony <27015 at riseup dot net>
pkgname=kio-s3-git
pkgver=r512.3d37741
pkgrel=2
pkgdesc="KIO worker for Amazon S3 and compatible storage (git version)"
arch=('x86_64')
url="https://invent.kde.org/network/kio-s3"
license=('GPL-2.0-or-later AND CC0-1.0')
depends=('aws-sdk-cpp-core' 'aws-sdk-cpp-s3' 'glibc' 'kcmutils' 'kconfig' 'kcoreaddons' 'ki18n' 'kio'
         'kirigami' 'kirigami-addons' 'libstdc++' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'extra-cmake-modules' 'cmake' 'kdoctools')
provides=('kio-s3')
conflicts=('kio-s3')
source=("git+https://invent.kde.org/network/kio-s3.git")
sha256sums=('SKIP')

pkgver() {
    cd kio-s3
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S kio-s3 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
