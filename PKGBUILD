# Maintainer: Nikolai Käck <nikolaikack@nikoware.com>
pkgname=xmq-git
pkgver=4.2.0.r127.g8c7f3b3
pkgrel=1
pkgdesc="A tool and language to work with xml/html/json/yaml and parse any other format using ixml."
arch=('x86_64')
url="https://github.com/libxmq/xmq"
license=('MIT')
depends=('glibc' 'libxml2' 'libxslt' 'zlib')
makedepends=('git' 'pkgconf')
optdepends=('bash-completion: for xmq shell completion')
provides=('xmq')
conflicts=('xmq')
options=('staticlibs')
source=("$pkgname::git+https://github.com/libxmq/xmq.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --match '[0-9]*' | sed 's/^\([^-]*\)-\([0-9]*\)-g\([0-9a-f]*\)$/\1.r\2.g\3/'
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --disable-asan --prefix=/usr
    make release
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr"
    ./install.sh build/default/release "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
