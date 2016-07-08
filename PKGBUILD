# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=linkchecker
_pkgname=LinkChecker
pkgver=9.3
pkgrel=2
pkgdesc="An utility to check HTML documents for broken links."
arch=('any')
url="http://wummel.github.io/linkchecker/"
license=('GPL')
depends=('python2>=2.5' 'python2-requests')
makedepends=('qt4')
optdepends=('python2-qscintilla: for gui version'
            'python2-pyqt4: for gui version')
source=(
    http://pypi.python.org/packages/source/L/LinkChecker/${_pkgname}-$pkgver.tar.gz
    patch.diff
)
sha256sums=('ee0aa60de440fdcf8587ddebf1f691bc777a32d8d4f119beed63f405dc56176d'
            'bdfc1f4f1da9e2cc567e0b7c2fa0160c6ebd2d25b18a3e8584b2aec43edb95d0')

prepare() {
    cd $_pkgname-$pkgver
    patch -Np1 < ../patch.diff
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  python2 setup.py sdist --manifest-only || return 1
  (cd doc/html; make)
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
