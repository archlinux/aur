# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver=10.11.0
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
sha256sums=('4cb30632e69673fc76e3d34f9409a42713a05dcafe3f2eaf104d811b6eeb1f83')
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
