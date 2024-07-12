# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-aiogithubapi'
_module=${pkgname#python-}
pkgver='24.6.0'
pkgrel=1
pkgdesc="Asynchronous Python client for the GitHub API"
url="https://github.com/ludeeus/aiogithubapi"
depends=(
	'python>=3.8'
	'python-poetry-core>=1.0.0'
	'python-aiohttp>=3.8'
	'python-async-timeout>=4'
	'python-backoff<3'
)

makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('a3fb7ba5476a53aa99c49c53ea26aceefa5d624bcb23722a0b90866453cdedfa898645b460a4dfb328f9fb4e6a131f969e8eebd3990565f0f6bfc1e0bede5322')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/python-aiogithubapi/LICENSE.md"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
