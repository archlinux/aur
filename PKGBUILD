# Merged with official ABS kfilemetadata PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfilemetadata-git
pkgver=5.83.0_r791.g27c7d9c
pkgrel=1
pkgdesc="A library for extracting file metadata"
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(ki18n-git karchive-git kconfig-git kcoreaddons-git exiv2 poppler-qt5 taglib ffmpeg ebook-tools)
optdepends=('catdoc: Extract text from Office 98 files')
makedepends=(git extra-cmake-modules-git catdoc doxygen qt5-tools libappimage)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('libappimage: AppImage extractor')
groups=(kf5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
