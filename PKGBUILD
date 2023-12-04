# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fastgron-git'
_pkgname='fastgron'
pkgver=0.7.0.r0.g5013f0b
pkgrel=1
pkgdesc='High-performance JSON to GRON (greppable, flattened JSON) converter (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/adamritter/fastgron'
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
noextract=("$_pkgname")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  export CFLAGS="${CFLAGS} -DNDEBUG"
  export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

  cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
}

build() {
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -vDm0644 "$_pkgname/GRON.md"   "$pkgdir/usr/share/doc/$pkgname/GRON.md"
  install -vDm0644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 "$_pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 4th December
#
# Don't Mistake the Finger Pointing at the Moon for the Moon.
#
# Forget the moon; there is no finger!
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
