# Maintainer: Can Altıparmak (c6p) <can6parmak <AT> gmail <DOT> com>

pkgname=pylanguagetool-git
pkgver=0.6.1.r82.g21e1589
pkgrel=1
pkgdesc="Python CLI for the LanguageTool JSON API"
arch=('any')
url="https://github.com/Findus23/pyLanguagetool"
license=('MIT')
depends=('python' 'python-colorama' 'python-configargparse' 'python-requests')
makedepends=('git' 'python-pip' 'python-wheel')
source=('pylanguagetool-git::git+https://github.com/Findus23/pyLanguagetool')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m setuptools.launch setup.py build
  #python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

