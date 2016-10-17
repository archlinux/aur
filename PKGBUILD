# Maintainer: Robin McCorkell <robin@mccorkell.me.uk>
pkgname=haxor-news
pkgver=0.4.1
pkgrel=1
pkgdesc="A Hacker News command line interface"
arch=(any)
url="https://github.com/donnemartin/haxor-news"
license=('Apache')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-requests'
  'python-pygments'
  'python-prompt_toolkit'
  'python-six'
)
source=(
  "$url/archive/$pkgver.tar.gz"
  "0001-prompt-toolkit.patch"
)

md5sums=('2adcbb65e4ecc8bc87084fed8b7d7713'
         '24001b78e3030c3b580807a001b31b80')

prepare() {
  cd "$srcdir"/"$pkgname-$pkgver"
  patch -Np1 < "${srcdir}/0001-prompt-toolkit.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
