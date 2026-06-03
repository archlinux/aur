# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-aiogithubapi'
_module=${pkgname#python-}
pkgver='26.0.0'
pkgrel=1
pkgdesc="Asynchronous Python client for the GitHub API"
url="https://github.com/ludeeus/aiogithubapi"
depends=(
	'python>=3.14'
	'python-aiohttp>=3.8'
	'python-async-timeout>=4'
)

makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('14996bc469d1efc5e7b5acecbf1bb1565e636a2a81adb3bb10ae57539df77088a0e2da08fbe2f38611cbe4da54cd6810092f671bf7df3b2b7121c9692cc8b743')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/python-aiogithubapi/LICENSE.md"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
