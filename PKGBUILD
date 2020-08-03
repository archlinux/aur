# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver='1.6.0'
pkgrel=2
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
	'python-flask: desktop client support'
	'svp: SmoothVideo Project server'
	'mpv-shim-default-shaders: default shader pack')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/jellyfin-mpv-shim/archive/v$pkgver.tar.gz")
sha256sums=('5adf171ee7f5e76a84ab65243e0043a9d3cbb37baf0964be58af94f534bc62a7')

build() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/jellyfin-mpv-shim-${pkgver}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	cd "${pkgdir}"
	ln -s "/usr/share/mpv-shim-default-shaders" "usr/lib/$(ls usr/lib/ | grep python)/site-packages/jellyfin_mpv_shim/default_shader_pack"
}
