# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver=10.9.0
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
sha256sums=('2bd411241f24333aedfbcef98c78ac157c22c1dbc0ee1fe127c52c90d3c43118')
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
