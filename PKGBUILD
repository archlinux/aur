# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kamil Bączkowski <me@kavela.ch>

pkgname=pywal-16-colors
_gitname=pywal16
pkgver=3.4.0
pkgrel=1
epoch=1
pkgdesc='Generate and change color-schemes on the fly (fork that uses 16 colors)'
arch=('any')
url="https://github.com/eylles/${_gitname}"
license=('MIT')
depends=(
  'imagemagick'
  'python'
)
makedepends=(
  'git'
  'python-setuptools'
)
optdepends=(
  'feh: set wallpaper'
  'nitrogen: set wallpaper'
  'python2: reload gtk2 themes on the fly'
)
provides=(
  'pywal'
  'python-pywal'
)
conflicts=(
  'pywal'
  'python-pywal'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('SKIP')

build() {
  cd "$srcdir/${_gitname}"
  python setup.py build
}

check() {
  cd "$srcdir/${_gitname}"
  python setup.py test
}

package() {
  cd "$srcdir/${_gitname}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
