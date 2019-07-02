# Contributor: Mario Rodas <marsam@users.noreply.github.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watchman-git
pkgver=4.9.0.r1158.g264484e0
pkgrel=1
pkgdesc='Watches files and records, or triggers actions, when they change.'
arch=('i686' 'x86_64')
url='https://facebook.github.io/watchman/'
license=('Apache')
depends=('pcre' 'openssl')
makedepends=('git' 'gflags' 'folly')
conflicts=('watchman')
provides=('watchman')
options=('!libtool' 'staticlibs')
source=("git+https://github.com/facebook/watchman.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

prepare() {
  cd ${pkgname%-git}
  sed -i '586,587d' getdeps.py
}

build() {
  cd ${pkgname%-git}
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON 
  make
}

check() {
  cd ${pkgname%-git}
  make check
}

package() {
  cd ${pkgname%-git}

  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr .
  make install
}
