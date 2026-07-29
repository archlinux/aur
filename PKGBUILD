# Maintainer: Tom Genco <tom at tomgenco dot com>

pkgname=tc2-launcher
pkgver=1.1.3
pkgrel=1
pkgdesc="Manages downloading and launching Team Comtress 2 (TC2)"
arch=('x86_64')
license=('MIT')
url="https://github.com/mastercomfig/tc2-launcher"
conflicts=('tc2-launcher-bin')
depends=(
	'glibc'
	'zlib'
)
makedepends=(
	'pyinstaller'
	'python-certifi'
	'python-psutil'
	'python-vdf'
	'python-pywebview'
	'python-aiohttp'
)
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png"
				'LICENSE')
sha256sums=('395a2bee3ecc7f666f3d9317bef6ea62033ab1ee131a35f79eef4eeee9d70319'
						'SKIP'
						'SKIP'
            'SKIP')

build() {
	cd "$pkgname-$pkgver"
	./build.sh
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/dist/TC2Launcher-linux" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/192x192/apps/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
