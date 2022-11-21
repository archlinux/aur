# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python38-prompt_toolkit
_name=prompt_toolkit
pkgver=3.0.32
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python"
arch=('any')
depends=('python38-pygments'
         'python38-wcwidth')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e7f2129cba4ff3b3656bbdda0e74ee00d2f874a8bcdb9dd16f5fec7b3e173cae')

build() {
  cd "$_name-$pkgver"
  python3.8 setup.py build
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=src PYTHONDONTWRITEBYTECODE=1  python3.8 -m pytest
}

package() {
  cd "$_name-$pkgver"
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
