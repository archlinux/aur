# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=pistache-git
_name=${pkgname%-git}
pkgver=985.c5927e1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Modern and elegant HTTP and REST framework for C++'
license=('APACHE')
depends=()
makedepends=('cmake' 'git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/oktal/${_name}"
source=("${_name}::git://github.com/oktal/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DPISTACHE_BUILD_TESTS=true \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

check() {
  cd "${srcdir}/${_name}"
  make test
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/lib{64,}
}
