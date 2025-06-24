# Maintainer: a821 at mail de
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych at mail dot com>
# Contributor: Jesper Jensen <delusionallogic at gmail dot com>

_pkgname=iniparser
pkgname=iniparser-git
pkgver=4.2.6
pkgrel=1
epoch=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64')
url="https://github.com/ndevilla/iniparser"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'doxygen' 'git')
provides=("${_pkgname}" 'libiniparser.so')
conflicts=("${_pkgname}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --tags | sed 's/^v//;s/-/.r/g;s/-/.g/'
}

build() {
  cmake -B build -S "$_pkgname" \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DBUILD_STATIC_LIBS=false
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
