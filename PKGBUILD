# Maintainer: kyndair
# kf5 group or kde-development-environment-meta will include all required dependencies

pkgname='kommit-git'
_pkgname='kommit'
pkgver=1.0.1.r17.gefb2be5
pkgrel=1
pkgdesc='KDE git gui'
arch=('i686' 'x86_64')
url='https://apps.kde.org/kommit/'
license=('GPL3')
provides=('kommit')
conflicts=('kommit' 'gitklient-git')
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'git' 'kdoctools' 'ktexteditor')
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme' 'kauth' 'kcodecs' 'kcompletion' 'kconfigwidgets' 'kconfig' 'kcoreaddons' 'kcrash' 'kdbusaddons' 'kio' 'kitemviews' 'ki18n' 'kjobwidgets' 'kparts' 'kservice' 'ktextwidgets' 'kwidgetsaddons' 'kxmlgui' 'qt5-base' 'solid' 'sonnet' 'syntax-highlighting')
source=("git+https://invent.kde.org/sdk/kommit.git")
sha256sums=('SKIP')

# update the package version to the current git version
pkgver() {
        cd "${srcdir}/${_pkgname}"
        git describe --long --tags | sed -r 's/v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${_pkgname}"
        mkdir -p build
        cd build
        cmake ..
        make
}

package() {
        cd "${srcdir}/${_pkgname}/build"
        make DESTDIR="$pkgdir/" install
}
