# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kbibtex-git
pkgver=0.8.90.r901.g816a7bc
pkgrel=1
pkgdesc="A BibTeX editor for KDE (latest development version, Qt6 version)"
arch=('x86_64' 'aarch64')
url='https://apps.kde.org/kbibtex/'
license=('GPL-2.0-or-later')
depends=('icu' 'kcompletion' 'kconfig''' 'kconfigwidgets' 'kcoreaddons' 'kcrash'
         'ki18n' 'kiconthemes' 'kitemviews' 'kio' 'kjobwidgets' 'kparts'
         'kservice' 'ktexteditor' 'ktextwidgets' 'kwallet' 'kwidgetsaddons'
         'kxmlgui' 'poppler-qt6' 'qt6-networkauth' 'qt6-webengine' )
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
provides=('kbibtex')
conflicts=('kbibtex')
optdepends=('okular: Document preview')
source=("git+https://invent.kde.org/office/kbibtex")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%%-git}" \
    -DBUILD_TESTING=OFF -DBUILD_KPART=ON -DQT_MAJOR_VERSION=6
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
