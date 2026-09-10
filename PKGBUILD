pkgname=okteta-qt6-git
pkgver=0.26.28.r1545.g77b9d8e
pkgrel=1
pkgdesc='KDE hex editor for viewing and editing the raw data of files (Qt6 git version)'
arch=(x86_64)
url='https://apps.kde.org/okteta/'
license=(GPL-2.0 GPL-3.0)
depends=('qt6-base'
         'qt6-declarative'
         'qt6-5compat'
         'kxmlgui'
         'kcolorscheme'
         'kcoreaddons'
         'kcrash'
         'kconfig'
         'kio'
         'kxmlgui'
         'kconfigwidgets'
         'ki18n'
         'kcompletion'
         'kdbusaddons'
         'kparts'
         'kwidgetsaddons'
)
makedepends=('ninja'
             'cmake'
             'kdoctools'
)
source=("git+https://github.com/KDE/okteta.git#branch=work/kossebau/kf6"
)
sha256sums=(SKIP
)

pkgver() {
    git -C okteta describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -B build \
        -S okteta \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
