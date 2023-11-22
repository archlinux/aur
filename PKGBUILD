pkgname=python-pyglet-git
pkgver=r5941.14997c29
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu')
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

build() {
  cd "$srcdir/pyglet"
  python setup.py build
}

package() {
  cd "$srcdir/pyglet"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
