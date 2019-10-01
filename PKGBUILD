# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='captain-ballard'
pkgver=1.0.0.r1.g44f8951
pkgrel=1
pkgdesc="Watch your .git directories periodically and reports the latest changes. (Github version)"
arch=('any')
url="https://github.com/LinArcX/captain-ballard"
license=('GPL-3.0')
makedepends=('git' 'cmake' 'pkgconf' 'glib')
depends=('gtk3' 'sqlite' 'libgit2' 'libappindicator-gtk3')
source=("${pkgname}::git+https://github.com/LinArcX/captain-ballard.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build; cd build/
  cmake -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ./release/captain-ballard ${pkgdir}/usr/bin/captain-ballard
  install -Dm644 ./appconf/captain-ballard.desktop ${pkgdir}/usr/share/applications/captain-ballard.desktop
  install -Dm644 ./appconf/captain-ballard.svg ${pkgdir}/usr/share/pixmaps/captain-ballard.svg
}


