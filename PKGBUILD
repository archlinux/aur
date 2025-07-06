# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=haruna-git
pkgver=1.4.0.r60.g929a9ee6
pkgrel=1
pkgdesc='Video player built with Qt/QML on top of libmpv'
arch=(x86_64)
url='https://apps.kde.org/haruna/'
license=(GPL-3.0-or-later)
depends=(ffmpeg
         gcc-libs
         glibc
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdeclarative
         kdsingleapplication
         kfilemetadata
         ki18n
         kio
         kirigami
         kwindowsystem
         mpvqt
         qqc2-desktop-style
         qt6-5compat
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             git
             kdoctools)
optdepends=('yt-dlp: YouTube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://invent.kde.org/multimedia/haruna.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cmake -B build -S "${pkgname%-*}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
