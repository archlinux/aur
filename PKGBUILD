# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-rsp-parallel-highscore-git
pkgver=r122.738c95c
pkgrel=1
pkgdesc="Parallel RSP plugin for Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/alice-mkh/parallel-rsp"
license=('LGPL-3.0-or-later OR MIT')
depends=('mupen64plus-git')
makedepends=(
  'cmake'
  'git'
)
optdepends=()
provides=("${pkgname%-git}" 'mupen64plus-rsp-parallel')
conflicts=("${pkgname%-git}" 'mupen64plus-rsp-parallel')
source=('git+https://github.com/alice-mkh/parallel-rsp.git')
sha256sums=('SKIP')

pkgver() {
  cd parallel-rsp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S parallel-rsp \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 parallel-rsp/LICENSE.MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
