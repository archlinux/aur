# Maintainer: Jerry Lin <jerry73204 at gmail dot com>
pkgname=('python-av-git' 'python2-av-git')
pkgver=r1052.81b0037
pkgrel=1
pkgdesc='Pythonic bindings for FFmpeg.'
arch=('i686' 'x86_64')
url="https://github.com/mikeboers/PyAV/tree/master"
license=('BSD 3-Clause')
depends=('ffmpeg' 'python' 'python2')
provides=('python-av')
conflicts=('python-av')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'cython')
source=('python-av::git+https://github.com/mikeboers/PyAV.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/python-av"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  cp -a python-av{,-py2}
}

build_python-av-git() {
  cd "$srcdir/python-av"
  python setup.py build
}

build_python2-av-git() {
  cd "$srcdir/python-av-py2"
  python2 setup.py build
}

package_python-av-git() {
  cd "$srcdir/python-av"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-av-git() {
  cd "$srcdir/python-av-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # rename /usr/bin/pyav to avoid filename conflict
  mv "$pkgdir/usr/bin/pyav"{,2}
}
