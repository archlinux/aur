# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-watchfiles'
_module=${pkgname#python-}
pkgver='0.18.1'
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
b2sums=('aa7cf11a8ceedfd2e7bd14c7327b40875e1aec66552ec973508f24a9f8294d00a475f54ba823dba898ae8d5490059b6079edcf01b93f3f6f76b3ace4375435c2')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-watchfiles/LICENSE"
	python -m installer --compile-bytecode=2 --destdir="${pkgdir}" dist/*.whl
}
