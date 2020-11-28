# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.10.1
pkgrel=2
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://pawamoy.github.io/showcase/aria2p"
license=('ISC')
depends=('python-loguru' 'python-requests' 'python-toml'
         'python-websocket-client' 'python-pyxdg')
optdepends=('aria2: aria2c daemon'
            'python-asciimatics: interactive interface support'
            'python-pyperclip: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "xdg.patch")
sha256sums=('13637e44dbeb27be4e4fe96b4dfca18857a999727852aeb59984768e33de7eb8'
            '1ab5a896ec75ec950151cb98703c1622439b19e5e9aa6bbd4f9703224043778b')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -p1 < ../xdg.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
