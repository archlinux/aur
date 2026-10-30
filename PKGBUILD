# Maintainer: rzy <me@23ro.org>
pkgbase=okular-mupdf
pkgname=okular-mupdf
pkgver=0.5.8
pkgrel=1
pkgdesc="Secure and fast MuPDF-based Okular backend for PDF, ePUB, MOBI, AZW3, and KFX"
arch=('x86_64')
url="https://github.com/l4rzy/okular-mupdf-ng"
license=('GPL-3.0-or-later')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'openssl' 'ninja' 'qt6-tools')
depends=('gcc-libs' 'glibc' 'kcoreaddons' 'ki18n' 'okular' 'qt6-base' 'qt6-5compat' 'nss' 'libseccomp' 'libmupdf>=1.28.0' 'zlib')
provides=('okular-mupdf-ng')
conflicts=('okular-mupdf-ng')
conflicts=(okular-mupdf-ng-dynamic okular-mupdf-ng-git)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
    cmake -B "build" -S "${srcdir}/${pkgname}" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DUSE_SYSTEM_MUPDF=ON
    cmake --build "build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "build"
}