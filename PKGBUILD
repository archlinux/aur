# $Id$
# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgbase=python-$_name
pkgname=("python-$_name" "python2-$_name")
pkgver=20181108
pkgrel=2
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome' 'python-sortedcontainers')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
    'python2-six' 'python2-pycryptodome' 'python2-sortedcontainers')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("git+https://github.com/pdfminer/${_name}.git#tag=${pkgver}")
sha384sums=('SKIP')

package_python-pdfminer.six() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pdfminer.six() {
  depends=('python2-six' 'python2-pycryptodome' 'python2-sortedcontainers')

  cd "$srcdir/$_name"
  python2 setup.py install --root="$pkgdir" --optimize=1
  files=("dumppdf" "latin2ascii" "pdf2txt")
  for bin in "${files[@]}"; do
    mv "$pkgdir/usr/bin/${bin}.py" "$pkgdir/usr/bin/${bin}2.py"
  done
}
