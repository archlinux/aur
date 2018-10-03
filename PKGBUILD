# Maintainer: drrossum <d.r.vanrossum at gmx.de>

pkgname=hgsubversion
pkgver=1.9.2
pkgrel=1
pkgdesc="extension for Mercurial that allows using Mercurial as a Subversion client"
url="https://bitbucket.org/durin42/hgsubversion"
arch=(any)
license=('GPL2')
depends=('mercurial' 'subversion')
source=("https://bitbucket.org/durin42/$pkgname/get/$pkgver.tar.bz2")
md5sums=('2541d0e5a7babae77001e525d76e4b8d')

prepare() {
  _dirname=$(tar -tf "${source[0]##*/}" | head -n 1 | cut -d/ -f1)
  mv $_dirname $pkgname-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

