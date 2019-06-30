# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=qobbar-git
pkgver=0.2.r5.g456c62c
pkgrel=1
pkgdesc='A fast and easy status bar built in qt'
arch=('x86_64')
url='https://github.com/zakariakov/qobbar'
license=('GPL3')
depends=('libxcomposite' 'libxdamage' 'qt5-x11extras')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr "${pkgname%-*}".pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname%-*}" INSTALL_ROOT="${pkgdir}" install
}
