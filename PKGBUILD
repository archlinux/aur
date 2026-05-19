# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver=10.7.2
pkgrel=1
pkgdesc="A pytube fork with additional features and fixes"
arch=("any")
url="https://github.com/JuanBindez/pytubefix"
license=("MIT")
makedepends=("python-build" "python-installer" "python-wheel")
depends=("python")
optdepends=('python-aiohttp: async HTTP support (AsyncYouTube)'
            'python-nodejs-wheel: bot-guard and nsig/sig JS execution')
provides=("pytubefix")
sha256sums=('f5caec0542b0249a1ebeb4289049e0ac55d032e9a160585d5c150c35d4a95dd1')
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/JuanBindez/pytubefix/archive/refs/tags/v$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
