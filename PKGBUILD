# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=pyglet
pkgname=('python-pyglet')
pkgver=2.0.2
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
md5sums=('dfaa7ae65c2a2a255c953c213a66dc83')
sha256sums=('a241f2352f391cb8f205e3f2b061ef74606e8d1698a762a3b99c5588e56830fc')

prepare() {
	cd "$srcdir/$pkgbase-$pkgver"

	# https://bitbucket.org/pyglet/pyglet/issues/157/please-do-not-bundle-the-future-module
	rm -rf pyglet/extlibs/future/
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
	python3 setup.py build
}

package_python-pyglet() {
	depends=('python' 'glu' 'python-future')
	cd "$srcdir/$pkgbase-$pkgver"
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
