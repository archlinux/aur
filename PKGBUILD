# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=wcp-git
pkgver=r86.e102349
pkgrel=1
pkgdesc="wcp is an experiment in re-implementing something like the standard cp file copy tool. The goal is to be as fast as possible, and provide the best possible progress bar, by counting up the total copy size in parallel with running the copy."
url="https://github.com/wheybags/wcp"
depends=('gcc-libs')
makedepends=('cmake' 'git')
arch=('x86_64')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('MIT')
source=("$pkgname::git+https://github.com/wheybags/wcp")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  install -Dm755 "build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:set ts=2 sw=2 et:
