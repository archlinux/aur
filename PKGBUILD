# Merged with official ABS falkon PKGBUILD by João, 2021/06/03 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: pavbaranov <pavbaranov at gmail dot com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=falkon-git
pkgver=3.1.99_r5703.g9bebc144
pkgrel=1
pkgdesc="Cross-platform QtWebEngine browser"
arch=($CARCH)
url="https://www.falkon.org/"
license=(GPL3)
depends=(qt5-webengine qt5-x11extras qt5-svg)
makedepends=(git extra-cmake-modules-git qt5-tools kio-git purpose-git libgnome-keyring pyside2 shiboken2)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kio-git: KDE integration' 'purpose-git: KDE integration' 'libgnome-keyring: gnome keyring integration'
            'pyside2: Python plugins')
replaces=(qupzilla)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'project(Falkon' CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
