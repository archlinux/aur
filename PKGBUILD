pkgname=python-pyglet-git
pkgver=r5378.65b862d3
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu' 'python-future')
makedepends=('python-setuptools' 'git')
optdepends=('ffmpeg: provides audio&video support'
            'openal: live audio')
conflicts=('python-pyglet')
provides=('python-pyglet')
source=("git+https://github.com/pyglet/pyglet.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pyglet"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/pyglet"

	# https://bitbucket.org/pyglet/pyglet/issues/157/please-do-not-bundle-the-future-module
	rm -rf pyglet/extlibs/future/
}

build() {
	cd "$srcdir/pyglet"
	python3 setup.py build
}

package() {
	depends=('python' 'glu' 'python-future')
	cd "$srcdir/pyglet"
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
