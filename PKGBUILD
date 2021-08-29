# Merged with official ABS kup PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kup-git
pkgver=0.9.1_r439.g96c0bc8
pkgrel=1
pkgdesc='A backup software for helping people to keep up-to-date backups'
arch=($CARCH)
url='https://apps.kde.org/kup/'
license=(GPL2)
depends=(kidletime-git kinit-git libgit2 hicolor-icon-theme)
makedepends=(git extra-cmake-modules-git plasma-framework-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('rsync: support for synced backups' 'bup: bup backend')
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
