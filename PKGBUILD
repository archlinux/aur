# Maintainer:  George Rawlinson <george@rawlinson.net.nz>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=zeal
pkgver=0.6.1
pkgrel=2
pkgdesc='An offline API documentation browser'
arch=('x86_64')
url='https://zealdocs.org/'
license=(GPL3)
depends=(qt5-webkit hicolor-icon-theme libarchive qt5-x11extras)
makedepends=(cmake ninja extra-cmake-modules)
source=("zeal-${pkgver}.tar.gz::https://github.com/zealdocs/zeal/archive/v${pkgver}.tar.gz"
        "github_pr-1218.patch")
sha512sums=('5b1a129980000c0fc8516e2c7d6c4a8de4adde7054ff8d9635e3be35441ad3ef0539746bbe1ca8abce7e6fb3d20c825b57661c3f8cd059ef1480db65ff81f3d9'
            '371d71a78b6d2e7fea8a9f2d19b0914d414ac33b722935d3ad3e19d9a9b2dd56569d3a6579657e46d13a94b71e675b326959c1f9b37a646487957419574d4b78')

prepare() {
  mkdir -p build

  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/github_pr-1218.patch"
}

build() {
  cd build

  cmake -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    "$srcdir/$pkgname-$pkgver"

  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
