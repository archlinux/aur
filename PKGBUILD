# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.5.4'
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
sha256sums=('b9a64f81beba57d22a81fa79138b2eab46ebef33213410be2bcfa58fbb4180a8'
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
