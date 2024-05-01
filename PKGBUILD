# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=cahute
pkgver=0.3
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
b2sums=("3dc1903ea4e3eef7dfa93f02048bc1df80a6f20654b5e77f965c37a1eb149c6a23ed7512a3c51ff44e15f2b992c3a52b12defe4aeabcd1a0a1b270af0bcbbfbf")

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

