# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=0.7.3.r50.g8efae07
pkgrel=1
pkgdesc='A Qt/QML video player built on top of libmpv'
url='https://invent.kde.org/multimedia/haruna'
arch=(x86_64)
license=(GPL3)
depends=(ffmpeg
         gcc-libs
         glibc
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdeclarative5
         kfilemetadata5
         ki18n5
         kio5
         kirigami2
         kwindowsystem5
         mpv
         qt5-base
         qt5-declarative
         qt5-quickcontrols2
         qt5-x11extras)
makedepends=(git
             extra-cmake-modules
             kdoctools5)
optdepends=('yt-dlp: YouTube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cmake -B build -S "${pkgname%-*}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
