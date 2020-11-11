# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ansiwrap
pkgver=0.8.4
_commit=20e2e8c78a54bdce947e38c069c5eb9c115423ae
pkgrel=3
pkgdesc="textwrap, but savvy to ANSI colors and styles"
url="https://github.com/jonathaneunice/ansiwrap"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-ansicolors')
source=("https://github.com/jonathaneunice/ansiwrap/archive/$_commit/$pkgname-$_commit.tar.gz"
        $pkgname-no-textwrap3.patch::https://github.com/jonathaneunice/ansiwrap/pull/16.patch)
sha512sums=('a01f1f1f79c7a84ca63013f6d05e2abeb00135905d1763f1b5d9fe430613c6bb10fbd2e345074e0001a8e7e40f1916d4c3a946da4dbb02fa288277ad441fab00'
            '54064900875534263a11ddfd013928383dbb2f00f6e3e6b098940bb1159c485439191667b6c742214c10ec84aca8e3cc62cdc3a5d9ea39cb3e2b74f13ad3a4a4')

prepare() {
  cd ansiwrap-$_commit
  patch -p1 -i ../$pkgname-no-textwrap3.patch
  sed -i 's/import textwrap3 as textwrap/import textwrap/' test/test_ansiwrap.py
  sed -i 's/textwrap3/textwrap/' ansiwrap/core.py
}

build() {
  cd ansiwrap-$_commit
  python setup.py build
}

check() {
  cd ansiwrap-$_commit
  python -m pytest
}

package() {
  cd ansiwrap-$_commit
  python setup.py install --root="$pkgdir" --optimize=1
}
