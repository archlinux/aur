# Maintainer: Daan van Rossum <d.r.vanrossum at gmx.de>

_hgname=yt
pkgname=python2-$_hgname-hg
pkgver=14123.7a0e5983e8a4
pkgrel=1
pkgdesc="python package for data analysis and visualization"
url="https://bitbucket.org/yt_analysis/yt"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-h5py' 'python2-matplotlib')
makedepends=('mercurial' 'cython2')
source=("hg+https://bitbucket.org/yt_analysis/yt")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_hgname"
  hg up -C "stable"
  perl -pi -e 's/python$/python2/g if 1' $(grep -rlm 1 '^#!.*python$')
  python2 setup.py build
}

package() {
  cd "$srcdir/$_hgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "$srcdir/$_hgname"
  hg identify -ni 2>/dev/null | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
