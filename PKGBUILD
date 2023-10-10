# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
pkgname=zsdx-git
pkgver=2097.a74690cf
pkgrel=1
epoch=
pkgdesc="A free 2D Zelda fangame."
arch=('any')
url="https://www.solarus-games.org/games/the-legend-of-zelda-mystery-of-solarus-dx/"
license=('custom')
depends=('solarus-git')
makedepends=('git' 'cmake' 'zip' )
provides=('zsdx')
conflicts=('zsdx')
source=("git+https://gitlab.com/solarus-games/games/zsdx.git")
md5sums=('SKIP')

pkgver() {
cd "${srcdir}/${pkgname%-git}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
cmake --build build
}

package() {
DESTDIR="$pkgdir" cmake --install build
install -Dm755 "$srcdir/zsdx/license.txt" "$pkgdir/usr/share/licenses/zsdx-git/LICENSE"
}
