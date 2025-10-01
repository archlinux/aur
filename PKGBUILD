# Maintainer: a821 at (nospam) mail de
# Contributor: Konstantin Gizdov <kgizdov at archlinux dot org>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Adam Ehlers Nyholm Thomsen<adament@adament.net>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=davix-git
pkgver=0.8.11rc1.r0.g3054c828
pkgrel=1
pkgdesc="Client for data and file management over the WebDav, Amazon S3, Microsoft Azure and HTTP procols"
arch=('x86_64')
url="https://github.com/cern-fts/davix"
license=('LGPL-2.1-or-later')
depends=('curl' 'libxml2' 'openssl' 'util-linux-libs')
makedepends=('doxygen' 'boost' 'cmake' 'git' 'python' 'gtest' 'nlohmann-json')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -r 's/^R_//;s/-rc/rc/;s/([0-9]+)-g/r\1.g/;s/[_-]/./g'
}

build() {
  cmake -B build -S $pkgname \
    -DLIB_SUFFIX="" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: set ts=2 sw=2 et:
