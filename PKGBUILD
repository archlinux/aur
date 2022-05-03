pkgname=python-pyglet-ffmpeg4
pkgver=1.5.23
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu' 'python-future' 'python-gobject')
makedepends=('python-setuptools')
optdepends=('ffmpeg4.4: provides audio&video support'
            'openal: live audio')
conflicts=('python-pyglet')
provides=('python-pyglet')
source=("https://files.pythonhosted.org/packages/source/p/pyglet/pyglet-$pkgver.zip")
md5sums=('a9b2190cf12af4f0eb6d5a0e788f4ffe')

prepare() {
	cd "$srcdir/pyglet-$pkgver"
        curl -L https://github.com/pyglet/pyglet/pull/604.patch | patch -p1
	# https://bitbucket.org/pyglet/pyglet/issues/157/please-do-not-bundle-the-future-module
	rm -rf pyglet/extlibs/future/
}

build() {
	cd "$srcdir/pyglet-$pkgver"
	python3 setup.py build
}

package() {
	depends=('python' 'glu' 'python-future')
	cd "$srcdir/pyglet-$pkgver"
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
