#Maintainer : silverhikari <kerrickethan@gmail.com>
#Contributor: kyndair
# kf5 group or kde-development-environment-meta will include all required dependencies

pkgname='kommit-git'
_pkgname='kommit'
pkgver=1.3.0.r12.g47325c6
pkgrel=1
pkgdesc='KDE git gui'
arch=('i686' 'x86_64')
url='https://apps.kde.org/kommit/'
license=('GPL3')
provides=('kommit')
conflicts=('kommit' 'gitklient-git')
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'git' 'kdoctools5' 'ktexteditor5')
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme' 'kauth5' 'kcodecs5' 'kcompletion5' 'kconfigwidgets5' 'kconfig5' 'kcoreaddons5' 'kcrash5' 'kdbusaddons5' 'kio5' 'kitemviews5' 'ki18n5' 'kjobwidgets5' 'kparts5' 'kservice5' 'ktextwidgets5' 'kwidgetsaddons5' 'kxmlgui5' 'qt5-base' 'solid5' 'sonnet5' 'syntax-highlighting5')
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
