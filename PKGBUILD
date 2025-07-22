# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=readerwriterqueue
pkgver=1.0.7
pkgrel=1
pkgdesc='A fast single-producer, single-consumer lock-free queue for C++'
arch=(any)
url='https://github.com/cameron314/readerwriterqueue'
license=(BSD-2-Clause)
#depends=()
makedepends=(git cmake ninja)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2635df4dc6c7b1e34e0ef152e7c104cbee1c5ff930370667afc4ff63cd59f72b8c623075b809c8ecc5b591e99823b4bb8dcea2b5443114a936b9bcc522b75c81')
b2sums=('caf8a03facb50986d31f41eb5c8f936dd2ad0feb62a1bcbbca9292e0c682ff8e57b786c2f93d1428261ad71fab62b003d487e36ee45ac6ba726ac18232c0f8b1')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=ON
    -G Ninja
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
