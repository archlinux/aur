# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.12.3
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://pawamoy.github.io/showcase/aria2p"
license=('ISC')
depends=('python' 'python-loguru' 'python-platformdirs' 'python-requests' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-pdm-backend')
optdepends=('aria2: aria2c daemon'
            'python-asciimatics: interactive interface support'
            'python-pyperclip: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c9d505ae6363092b5ea558160b408677adba876c89a50f9129e7505965e56d00')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
