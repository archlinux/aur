# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver=10.4.0
pkgrel=3
pkgdesc="A pytube fork with additional features and fixes"
arch=("any")
url="https://github.com/JuanBindez/pytubefix"
license=("MIT")
makedepends=("python-build" "python-installer" "python-wheel")
depends=("python")
optdepends=('python-aiohttp: async HTTP support (AsyncYouTube)'
            'python-nodejs-wheel: bot-guard and nsig/sig JS execution')
provides=("pytubefix")
sha256sums=('335833673a9e7bf0039c5a58c72423c7ab913eab485d1f2d3927b84b11d6fe86')
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
