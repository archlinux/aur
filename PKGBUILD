# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>
# Contributor: liberodark

pkgname=guitar
pkgver=1.1.1
pkgrel=2
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL)
depends=(qt5-svg git file)
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/soramimi/Guitar/archive/v${pkgver}.tar.gz"
        "https://github.com/soramimi/Guitar/commit/9c4708ba7a4a40b08b1083ee75b23ad66a411a50.diff")
sha256sums=('9155fc7c8f28972ecf40ad0badc5a519b50a28e92f54e4e6ea2570ec5ecdf957'
            'b54e53632eab11e3af9d79de4243550ce70009bf305e492e842e134d88e35cec')

prepare() {
  cd "Guitar-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/9c4708ba7a4a40b08b1083ee75b23ad66a411a50.diff"
  mkdir -p build
}

build() {
  cd "$srcdir/Guitar-${pkgver}/build"
  cmake ..
  make
}

package() {
  cd "Guitar-${pkgver}"
  install -Dm755 "build/Guitar" "$pkgdir/usr/bin/$pkgname"
  install -D "LinuxDesktop/Guitar.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D "LinuxDesktop/guitar.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
