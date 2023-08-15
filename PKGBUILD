# Maintainer: éclairevoyant
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ov3rl0w <dalcjor at libmail dot eu>
# Contributor: Morten Linderud <foxboron at archlinux dot org>
# Contributor: Sean Haugh <seanphaugh at gmail dot com>

_pkgname=pywal
pkgname="$_pkgname-git"
pkgver=3.3.0.r134.g236aa48
pkgrel=2
pkgdesc="Generate and change color-schemes on the fly."
arch=(any)
url="https://github.com/dylanaraps/pywal"
license=(MIT)
depends=(imagemagick python)
makedepends=(git python-{build,installer,wheel} python-setuptools)
optdepends=(
	'colorz: alternative backend'
	'feh: set wallpaper'
	'nitrogen: set wallpaper'
	'python-haishoku: alternative backend'
	'python-colorthief: alternative backend'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	python -m build -wn
}

package() {
	cd $_pkgname
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
