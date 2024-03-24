# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=cahute
pkgver=0.2
pkgrel=1
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators"
arch=('x86_64')
url="https://cahuteproject.org"
license=('custom:CeCILL')
depends=('libusb' 'sdl2')
makedepends=('cmake')
provides=('p7' 'libp7' 'p7screen')
replaces=('p7' 'libp7' 'p7screen')
options=(!strip)
install="$pkgname.install"
source=("https://ftp.cahuteproject.org/releases/$pkgname-$pkgver.tar.gz")
b2sums=("dde138b4a90b0c4d19018f1530966963d26e8680ace3b4e0fba414425dff0190789036ea20dcd935e94ae42766c88505efb8885ce03cd73572db907af45f26f6")

prepare() {
  cd "$pkgname-$pkgver"

  # ensure a clean build
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build --strip

	install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

