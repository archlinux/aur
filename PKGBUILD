# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.11.0
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://pawamoy.github.io/showcase/aria2p"
license=('ISC')
depends=('python-appdirs' 'python-loguru' 'python-requests'
         'python-toml' 'python-websocket-client' )
makedepends=('python-build' 'python-install' 'python-pdm-pep517' 'python-wheel')
optdepends=('aria2: aria2c daemon'
            'python-asciimatics: interactive interface support'
            'python-pyperclip: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('63df0f4245b9424457c2a8002732c21c13d4e29712f8e865e02dac60476e93f4')

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
