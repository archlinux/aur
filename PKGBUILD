# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=noteshrink-git
_pkgname=noteshrink
pkgver=r31.3f831fd
pkgrel=2
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-pillow')
conflicts=('noteshrink')
source=('git+http://github.com/mzucker/noteshrink.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    sed -i '1 s/python/python2/g' noteshrink.py
    python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
