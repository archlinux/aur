# $Id$
# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgbase=python-$_name
pkgname=("python-$_name" "python2-$_name")
pkgver=20170720
pkgrel=1
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome')
makedepends=('python-setuptools' 'python2-setuptools'
    'python2-six' 'python2-pycryptodome')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha384sums=('4742701158a58179f40745ae14dda53bbe38b6282d7a95368f7efc14ce455517a9141b3c1c6998aef5ee1dd78883cad6')

package_python-pdfminer.six() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pdfminer.six() {
  depends=('python2-six' 'python2-pycryptodome')

  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  files=("dumppdf" "latin2ascii" "pdf2txt")
  for bin in "${files[@]}"; do
    mv "$pkgdir/usr/bin/${bin}.py" "$pkgdir/usr/bin/${bin}2.py"
  done
}
