# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=coconut-lang
_name=coconut
pkgver=1.4.3
pkgrel=1
pkgdesc="Simple, elegant, Pythonic functional programming."
arch=('any')
url="http://coconut-lang.org/"
license=('Apache')
depends=('python' 'python-pyparsing' 'python-prompt_toolkit' 'python-pygments')
source=($pkgname-$pkgver.tgz::https://github.com/evhub/coconut/archive/v$pkgver.tar.gz)
md5sums=('b7cd3cec147b9cd5051499cf3b802163')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # the v1.3.X series wasn't usable on Arch because it requires ancient versions of libraries
  # disabling the requirements caused an infinite loop/OOM
  #sed -i  's/version_strictly = (/&); (\\/' coconut/constants.py
  # 1.4.3 seems better, but still has warnings
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}


