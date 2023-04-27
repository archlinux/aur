# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-watchfiles'
_module=${pkgname#python-}
pkgver='0.19.0'
pkgrel=1
pkgdesc="Simple, modern and high performance file watching and code reload in python."
url="https://github.com/samuelcolvin/watchfiles"
depends=(
	'python'
	'python-anyio>=3.0.0'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-maturin'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('32470ccc0541b6b9bff8b2fb233d2664c6b761b66da8a5b22eda071ceb8a040e4eaafb346bc7bf0336ae64d7083ba77ae3c0c688dda7f1daceba0960ea9513e6')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-watchfiles/LICENSE"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
