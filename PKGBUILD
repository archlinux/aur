# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-aiogithubapi'
_module=${pkgname#python-}
pkgver='23.2.1'
pkgrel=1
pkgdesc="Asynchronous Python client for the GitHub API"
url="https://github.com/ludeeus/aiogithubapi"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('454d34d34508051e4b85998b9e8d228ac77ac6ffcd0d859b10793457816987ff31d5ed5335ce70ce6b2eb19036c78c82a6bb9a40bac6fedba3fe4c438d7b4180')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/python-aiogithubapi/LICENSE.md"
    python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
