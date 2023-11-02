# Merged with official ABS breeze PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-git
pkgver=5.27.80_r2749.ga6e24edc
pkgrel=1
arch=($CARCH)
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(frameworkintegration5 kdecoration-git breeze-icons-git kwayland-git hicolor-icon-theme kirigami2-git kirigami-addons-git)
makedepends=(git extra-cmake-modules-git kcmutils5)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('breeze-gtk-git: Breeze widget style for GTK applications'
            'kcmutils-git: for breeze-settings')
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
