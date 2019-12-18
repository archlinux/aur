# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alejandro Valdes <alejandrovaldes@live.com>
# Contributor: liberodark

pkgname=guitar
pkgver=1.1.1
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL)
depends=(qt5-svg git file)
makedepends=(ruby cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/soramimi/Guitar/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/guitar-zlib.patch")
sha256sums=('9155fc7c8f28972ecf40ad0badc5a519b50a28e92f54e4e6ea2570ec5ecdf957'
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
  install -D "LinuxDesktop/Guitar.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D "LinuxDesktop/guitar.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
