# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=cahute
pkgver=0.5
pkgrel=1
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators"
arch=('x86_64')
url="https://cahuteproject.org"
license=('custom:CeCILL')
depends=('libusb' 'sdl2')
makedepends=('cmake' 'python' 'python-toml')
provides=('p7' 'libp7' 'p7screen')
replaces=('p7' 'libp7' 'p7screen')
options=(!strip)
install="$pkgname.install"
source=("https://ftp.cahuteproject.org/releases/$pkgname-$pkgver.tar.gz")
b2sums=("e71dd07dff56b2593c732d6d6fa72f66465c81b1fa34c5cda84277a2d4e6197aee3d4740a425a54c9a27b781be26e032369e6add205906add00433d1fb47c2a7")

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

