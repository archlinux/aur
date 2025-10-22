# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=peru
pkgver=1.3.5
pkgrel=1
pkgdesc="A tool for fetching code"
arch=('any')
depends=('git' 'python' 'python-yaml')
makedepends=(python-build python-installer python-hatch)
optdepends=('mercurial: fetching from hg repos'
            'subversion: fetching from svn repos')
url="https://github.com/buildinspace/peru"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/buildinspace/$pkgname/tar.gz/$pkgver)
sha256sums=('be16ebd78f95cbc1698d23404600793868f08d2856b8dd4da793355d48eceeb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership docs/* "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  python -m installer --destdir="$pkgdir" dist/*.whl
}
