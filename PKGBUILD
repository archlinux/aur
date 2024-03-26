# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributer : Sandor Nagy <sandor.nagy[at]kdemail[dot]net>
pkgname=rcssserver
pkgver=19.0.0
pkgrel=1
pkgdesc="The RoboCup Soccer Simulator Server is a research and educational tool for multi-agent systems and artificial intelligence. It allows 11 simulated autonomous robotic players to play soccer."
arch=('x86_64')
url="https://github.com/rcsoccersim/rcssserver"
license=('LGPL-3.0-or-later')
depends=('boost-libs>=1.44')
makedepends=('boost>=1.44' 'cmake')
optdepends=('rcssmonitor: RCSS Monitor'
            'librcsc: basic library to develop the RCSS client and tools')
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('fc7056a2f76cd68480f494442caa6ee678bad1df809ba41d4ba5895926cafa1e')

build() {
	cmake -B build -S "$pkgname-$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	cd "$pkgname-$pkgname-$pkgver"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
