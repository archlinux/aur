# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>
# Contributer: Antonio Rojas <arojas@archlinux.org>

_pkgname=libqaccessibilityclient
pkgname=libqaccessibilityclient-git
pkgver=v0.2.0.r35.caa0cb9
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="Helper library to make writing accessibility tools easier git version"
url='https://www.kde.org'
license=(LGPL)
depends=(qt5-base)
makedepends=('cmake' 'extra-cmake-modules' 'git')
conflicts=(libkdeaccessibilityclient libqaccessibilityclient)
provides=(libkdeaccessibilityclient libqaccessibilityclient)
source=("git+https://github.com/KDE/libqaccessibilityclient.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}/build"
  cd "${srcdir}/${_pkgname}/build"
  cmake src/ -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
}
