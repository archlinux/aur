# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Daan van Rossum <d.r.vanrossum at gmx.de>

_hgname=yt
pkgname=python-$_hgname-hg
pkgver=15224.96cea0d52f8a
pkgrel=1
pkgdesc="python package for data analysis and visualization"
url="https://bitbucket.org/yt_analysis/yt"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-h5py' 'python-matplotlib')
makedepends=('mercurial' 'cython')
source=("hg+https://bitbucket.org/yt_analysis/yt")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_hgname"
  hg up -C "stable"
  python setup.py build
}

package() {
  cd "$srcdir/$_hgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "$srcdir/$_hgname"
  hg identify -ni 2>/dev/null | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
