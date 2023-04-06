# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=('python-pyglet1.5')
pkgver=1.5.27
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu' 'python-future')
makedepends=('python-setuptools')
optdepends=('ffmpeg: provides audio&video support'
            'openal: live audio')
source=("https://files.pythonhosted.org/packages/source/p/pyglet/pyglet-$pkgver.zip")
md5sums=('40f6c92efc3f2f25f546ff84276e8d08')
sha256sums=('4d00e067451f3b10fd51b69764fddab65444372a2da344ee2b35f0a8e6ebf005')

prepare() {
	cd "$srcdir/pyglet-$pkgver"

	# https://bitbucket.org/pyglet/pyglet/issues/157/please-do-not-bundle-the-future-module
	rm -rf pyglet/extlibs/future/
}

build() {
	cd "$srcdir/pyglet-$pkgver"
	python setup.py build
}

package() {
	depends=('python' 'glu' 'python-future')
	cd "$srcdir/pyglet-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
