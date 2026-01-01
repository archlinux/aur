# Maintainer: Thomas Touhey <thomas@touhey.fr>
_pkgname=cahute
pkgname=$_pkgname-git
pkgver=0.6
pkgrel=1
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators"
arch=('x86_64')
url="https://next.cahuteproject.org"
license=('custom:CeCILL')
depends=('libusb' 'sdl2')
makedepends=('cmake' 'python' 'python-toml')
provides=('p7' 'libp7' 'p7screen' 'p7os' 'cahute')
conflicts=('p7' 'libp7' 'p7screen' 'p7os' 'cahute')
options=(!strip)
install="$pkgname.install"
source=("git+https://gitlab.com/cahute/cahute.git")
b2sums=('SKIP')

build() {
	cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build --strip

	install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

