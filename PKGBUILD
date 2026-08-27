# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

_pkgname=innoextract
pkgname=${_pkgname}-crazy-max
pkgver=1.13.0
pkgrel=1
pkgdesc="A tool to extract installers created by Inno Setup - crazy-max fork"
url='https://github.com/crazy-max/innoextract'
arch=('x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake' 'git')
provides=($_pkgname)
conflicts=($_pkgname{,-git,-bin} $pkgname-{git,bin})
source=($_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f41b8afcd51d81b2be8cef58004ce88d64337e1092617cfa3f3de350834e0961')

build() {
    cd "$_pkgname-$pkgver"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -m644  CHANGELOG "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
