# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname='python2-pyglet'
pkgver=1.4.10
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python2' 'glu' 'python2-future')
makedepends=('python2-setuptools')
optdepends=('ffmpeg: provides audio&video support')
source=("https://files.pythonhosted.org/packages/source/p/pyglet/pyglet-$pkgver.zip")
sha512sums=('89e23752a92be1138c8a3f5c9958149be7473d3812218dabe1f9478270579d9af065215b9884e3ee3bb1e8f04f00423b41575fdee774368b8182424910a7b0cf')

prepare() {
	cd "$srcdir"
	# https://bitbucket.org/pyglet/pyglet/issues/157/please-do-not-bundle-the-future-module
	rm -rf pyglet-$pkgver/pyglet/extlibs/future/
}

build() {
	cd "$srcdir/pyglet-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/pyglet-$pkgver"
	find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python$|/usr/bin/env python2|'
	find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

