# Maintainer: algebro <algebro at tuta dot io>

pkgname=python-prompt_toolkit1
_name=prompt_toolkit
pkgver=1.0.15
pkgrel=2
pkgdesc="Library for building powerful interactive command lines in Python (1.x branch). Python 3 version from PyPi."
arch=('any')
depends=('python-pygments' 'python-six' 'python-wcwidth')
makedepends=('python-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917')

prepare() {
    cd "$srcdir"
    cp -r $_name-$pkgver python-$_name-$pkgver
    # rearrange a bunch of stuff to avoid version conflicts
    cd "$srcdir/python-$_name-$pkgver"
    mv -f prompt_toolkit prompt_toolkit1
    find ./ -type f -exec sed -i -e 's/prompt_toolkit/prompt_toolkit1/g' {} \;  
}

build() {
    cd "$srcdir/python-$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/python-$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
