# Maintainer: attackuwu911 <daniil.baskakov13@gmail.com>
# Former Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=python-discord_rpc
_name=${pkgname#python-}
pkgver=5.5
pkgrel=1
pkgdesc='An Python wrapper for Discord RPC.'
arch=('any')
url='https://github.com/Senophyx/discord-rpc'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('SKIP') # Сейчас обновим одной командой

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
