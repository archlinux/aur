# Merged with official ABS kdeplasma-addons PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefano Avallone <stavallo@gmail.com>

pkgname=kdeplasma-addons-git
pkgver=5.22.80_r8520.ga6435e48c
pkgrel=1
pkgdesc='All kind of addons to improve your Plasma experience'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(plasma-workspace-git)
makedepends=(git extra-cmake-modules-git kross-git qt5-webengine)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kross-git: comic applet'
            'purpose-git: Quickshare applet'
            'quota-tools: disk quota applet'
            'qt5-webengine: dictionary and webbrowser applets')
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
