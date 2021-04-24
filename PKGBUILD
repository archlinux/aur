# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-prompt_toolkit1
_name=prompt_toolkit
pkgver=1.0.15
pkgrel=2
pkgdesc="Library for building powerful interactive command lines in Python"
arch=('any')
depends=('python2-pygments'
         'python2-six'
         'python2-wcwidth')
makedepends=('python2-setuptools' 'python2-pygments' 'python2-six'
             'python2-wcwidth')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
md5sums=('8fe70295006dbc8afedd43e5eba99032')
sha256sums=('858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917')

prepare() {
  cd "$srcdir"
  cp -r $_name-$pkgver python2-$_name-$pkgver
  # rearrange a bunch of stuff to avoid version conflicts
  cd "$srcdir/python2-$_name-$pkgver"
  mv -f prompt_toolkit prompt_toolkit1
  find ./ -type f -exec sed -i -e 's/prompt_toolkit/prompt_toolkit1/g' {} \;
}

build() {
  cd "$srcdir/python2-$_name-$pkgver"
  python2 setup.py build
}

package() {
  depends=('python2-pygments'
           'python2-six'
           'python2-wcwidth')
  cd "$srcdir/python2-$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

