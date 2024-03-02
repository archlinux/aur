# Merged with official ABS kfilemetadata PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfilemetadata-git
pkgver=6.0.0_r1093.gb0b1666
pkgrel=2
pkgdesc="A library for extracting file metadata"
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc ebook-tools exiv2-git ffmpeg karchive-git kconfig-git kcoreaddons-git ki18n-git poppler-qt6 qt6-base taglib)
makedepends=(git catdoc doxygen extra-cmake-modules-git kdegraphics-mobipocket-git libappimage qt6-doc qt6-tools)
optdepends=('catdoc: Extract text from Office 98 files'
            'kdegraphics-mobipocket-git: MOBI extractor'
            'libappimage: AppImage extractor')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
