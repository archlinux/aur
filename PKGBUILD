# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.5.5'
pkgrel=1
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV. (Unofficial)"
arch=('any')
url='https://github.com/iwalton3/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-mpv' 'python-mpv-jsonipc>=1.1.8' 'python-jellyfin-apiclient>=1.4.0' 'tk')
makedepends=('python-setuptools')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview: desktop client and display mirroring support'
	'python-werkzeug: desktop client support'
	'python-flask: desktop client support')
source=("https://pypi.python.org/packages/source/j/jellyfin-mpv-shim/jellyfin-mpv-shim-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/iwalton3/jellyfin-mpv-shim/master/LICENSE.md")
sha256sums=('2ba9ee82f02e8914c8f99e3aa1aac6616f631b92f4baedb2c67026e19944608e'
	'e36bf8f5853f1dff59a4973e0911d5c90d5d94be33b8096158321fae4445d98a')

build() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "jellyfin-mpv-shim-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
