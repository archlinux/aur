# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-uvicorn'
_module=${pkgname#python-}
pkgver='0.21.1'
pkgrel=1
pkgdesc="The lightning-fast ASGI server."
url="https://www.uvicorn.org/"
depends=(
	'python>=3.8'
	'python-click>=7.0'
	'python-h11>=0.8'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'python-httptools>=0.5.0'
	'python-dotenv>=0.13'
	'python-yaml>=5.1'
	'python-watchfiles>=0.13'
	'python-websockets>=10.4'
)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('9d318d9513fc7891823bf95eb247e2e6394a9ddaee0f351efc896fe50a3c31b433ce8ca1f56bc2f74e49ada5e097742fe9a85c34ac292bdfad11642a48652e04')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/python-uvicorn/LICENSE.md"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
