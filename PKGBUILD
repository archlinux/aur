# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=cahute
pkgver=0.1
pkgrel=2
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
sha256sums=('58849376b5cd8393bd7fee25739b9c95e506488860bf174cef1ba8f2aa97e1c8')

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

