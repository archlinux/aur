# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=python-discord_rpc
_name=${pkgname#python-}
pkgver=5.1
pkgrel=1
pkgdesc='An Python wrapper for Discord RPC.'
arch=('any')
url='https://github.com/Senophyx/discord-rpc'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cb6e8745ec0657d1beae34d87c3e7180251dcdef67fab78bd5aaa0e43708c468')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

## No tests are provided in the repository.

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
