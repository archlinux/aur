# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyglet-git
_name=${pkgname#python-}
_name=${_name%-git}
pkgver=2.1.8.r5.g59f4579f
pkgrel=2
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD-3-Clause')
depends=(
	'glib2'
	'gstreamer'
	'python'
	'python-gobject'
	'python-pillow'
	# AUR
	'python-pyogg'
)
makedepends=(
	'git'
	'python-setuptools'
	'python-build'
	'python-flit-core'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'ffmpeg: provides audio&video support'
	'openal: live audio'
)
conflicts=('python-pyglet')
provides=('python-pyglet')
source=("${_name}::git+https://github.com/pyglet/pyglet.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
