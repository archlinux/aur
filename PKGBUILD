# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>
# Contributor: liberodark

pkgname=guitar
pkgver=1.0.0
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL)
depends=(qt5-svg git file)
makedepends=(ruby cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/soramimi/Guitar/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/guitar-zlib.patch")
sha256sums=('195cb61012d5586d7e6f819f4d3b3caee2c35f0b806629c6ee1c894548ba0075'
            '794c814a3181a3c0f69406876972df06d1e885033624aa5e6141cdf9ece2cfa7'
            'fe61f4003461995615ba62cc7b70f3c32872aba5b84129e35e590014f52db87e')

prepare() {
  cd "Guitar-${pkgver}"
  ruby prepare.rb
  patch --forward --strip=1 --input="${srcdir}/guitar-zlib.patch"
  mkdir -p build
}

build() {
  cd "$srcdir/Guitar-${pkgver}/build"
  qmake ../Guitar.pro
  make
}

package() {
  cd "Guitar-${pkgver}"
  install -Dm755 "_bin/Guitar" "$pkgdir/usr/bin/$pkgname"
  install -D "LinuxDesktop/Guitar.svg" "$pkgdir/usr/share/pixmaps/${pkgname}.svg"
  install -D "$srcdir/guitar.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
