# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.11.1
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://pawamoy.github.io/showcase/aria2p"
license=('ISC')
depends=('python-appdirs' 'python-loguru' 'python-requests'
         'python-toml' 'python-websocket-client' )
makedepends=('python-build' 'python-install' 'python-pdm-pep517')
optdepends=('aria2: aria2c daemon'
            'python-asciimatics: interactive interface support'
            'python-pyperclip: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('826c2b237057b2e481fede4959f1397996e789f181d90dfca706f28f0ef5bbef')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
    chmod +x "${pkgdir}"/usr/bin/*
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
