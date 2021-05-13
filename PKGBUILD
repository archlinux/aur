# Maintainer: Electro707 <develop@electro707.com>

pkgname=cantor-git
pkgver=v21.03.90.r14.g85e59eb3
pkgrel=1
pkgdesc='KDE Frontend to Mathematical Software'
url='https://apps.kde.org/cantor/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-education)
depends=(analitza libspectre kpty ktexteditor knewstuff libqalculate hicolor-icon-theme qt5-xmlpatterns poppler-qt5)
makedepends=(git extra-cmake-modules python kdoctools luajit r julia)
conflicts=('cantor')
provides=('cantor')
optdepends=('maxima: Maxima backend'
            'octave: Octave backend'
            'r: R backend'
            'luajit: LUA backend'
            'python: Python backend'
            'sagemath: SageMath backend'
            'julia: Julia backend')
source=("${pkgname}"'::git+https://invent.kde.org/education/cantor.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build -S . \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}
