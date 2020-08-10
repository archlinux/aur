# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Stefano Capitani <stefano@manjaro.org>

pkgname=papirus-maia-icon-theme-git
pkgver=20200417.7338bf0
pkgrel=1
pkgdesc="Manjaro variation of Papirus icon theme (git version)"
arch=('any')
url="https://github.com/Ste74/papirus-maia-icon-theme"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme-git')
makedepends=('cmake' 'git')
conflicts=("${pkgname/-git/}")
options=('!strip')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname/-git/}
    (
    git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
    echo .
    git rev-parse --short master
    ) | tr -d '\n'
}

build() {
    mkdir -p ${srcdir}/build
    cd ${srcdir}/build
    cmake ../${pkgname/-git/}
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
