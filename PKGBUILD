# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.5.11'
pkgrel=1
pkgdesc="Cast media from Jellyfin Mobile and Web apps to MPV. (Unofficial)"
arch=('any')
url='https://github.com/iwalton3/jellyfin-mpv-shim'
license=('MIT')
depends=('mpv' 'python>=3.6' 'python-mpv' 'python-mpv-jsonipc>=1.1.9' 'python-jellyfin-apiclient>=1.5.1' 'tk')
makedepends=('python-setuptools')
optdepends=('python-pystray: systray support'
	'python-jinja: display mirroring support'
	'python-pywebview>=3.3.1: desktop client and display mirroring support'
	'python-werkzeug: desktop client support'
	'python-flask: desktop client support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/jellyfin-mpv-shim/archive/v$pkgver.tar.gz")
sha256sums=('b7b98af801b89a130c8b3564eb87158e48e01240b6382a559798aa63e3d9f056')

build() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
