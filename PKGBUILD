# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

_gitname=yt
pkgname=python-$_gitname-git
pkgver=3.4.1.r1921.gb89c170ba
pkgrel=1
pkgdesc="python package for data analysis and visualization"
url="https://github.com/yt-project"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-h5py' 'python-numpy' 'python-matplotlib' 'python-nose' 'python-sympy')
makedepends=('git' 'cython')
source=("git+https://github.com/yt-project/yt")
md5sums=(SKIP)

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^yt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
