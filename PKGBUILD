# Maintainer: Allen Li <darkfeline@felesatra.moe>
pkgname=python-pyglet-hg
pkgver=r3313.f388bbe83f4e
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python 3."
arch=(any)
url="http://pyglet.org"
license=('BSD')
depends=('python')
optdepends=('avbin: for compressed audio/video')
makedepends=('python-setuptools' 'mercurial')
conflicts=('python-pyglet')
provides=('python-pyglet')
source=("pyglet::hg+https://bitbucket.org/pyglet/pyglet")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/pyglet"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/pyglet
  python setup.py build
}

package() {
  cd $srcdir/pyglet
  python setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/pyglet/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
