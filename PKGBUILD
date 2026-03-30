# Maintainer: robinpie <robin413@protonmail.com>
pkgname=hash-o-matic-git
_pkgname=hash-o-matic
pkgver=1.0.1.r128.g6917ded
pkgrel=1
pkgdesc='Simple hash validator for comparing files, generating checksums, and verifying hashes'
arch=('x86_64')
url='https://apps.kde.org/hashomatic/'
license=('LGPL-2.1-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'gpgmepp'
    'hicolor-icon-theme'
    'kconfig'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kwindowsystem'
    'kirigami'
    'kirigami-addons'
    'libkleo'
    'qgpgme'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://invent.kde.org/utilities/hash-o-matic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$_pkgname" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
