# Merged with official ABS kup PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kup-git
pkgver=0.8.0_r688.gd49e09c
pkgrel=1
pkgdesc='A backup software for helping people to keep up-to-date backups'
arch=($CARCH)
url='https://apps.kde.org/kup/'
license=(GPL-2.0-only GPL-2.0-or-later GPL-3.0-only)
depends=(gcc-libs glibc kcmutils-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kdbusaddons-git kdeclarative-git ki18n-git kidletime-git kio-git kirigami-git kjobwidgets-git knotifications-git kwidgetsaddons-git kxmlgui-git libgit2 libplasma-git plasma5support-git qt6-base qt6-declarative solid-git)
makedepends=(git extra-cmake-modules-git git)
optdepends=('bup: bup backend'
            'rsync: support for synced backups')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep '<release version=' org.kde.kup.appdata.xml | tail -1 | cut -d '"' -f2)"
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
