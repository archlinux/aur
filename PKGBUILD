# Maintainer: Nikolai Käck <nikolaikack@nikoware.com>
pkgname=xmq
pkgver=4.2.0
pkgrel=1
pkgdesc="A tool and language to work with xml/html/json/yaml and parse any other format using ixml."
arch=('x86_64')
url="https://github.com/libxmq/xmq"
license=('MIT')
depends=('glibc' 'libxml2' 'libxslt' 'zlib')
makedepends=('pkgconf')
optdepends=('bash-completion: for xmq shell completion')
conflicts=('xmq-git')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libxmq/xmq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a8fa90f53611a168ee3052c49f4c4b241481fd35c72fe04fd9d925b102ca91ee')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    printf '%s\n' "$pkgver" > dist/VERSION
    ./configure --disable-asan --prefix=/usr
    make release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir/usr"
    ./install.sh build/default/release "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}