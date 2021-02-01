# Merged with official ABS kldap PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kldap-git
pkgver=5.16.44_r815.ge924400
pkgrel=1
pkgdesc="LDAP access API for KDE"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL)
groups=(kdepim-git)
depends=(kcompletion-git kwallet-git)
optdepends=('kio-git: LDAP kio-gitslave')
makedepends=(git extra-cmake-modules-git kio-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
