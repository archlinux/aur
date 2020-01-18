# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pandoc-imagine
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.1.6
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Imagine is a pandoc filter that will turn codeblocks tagged with certain classes into images or ascii art.."
url="https://github.com/hertogp/imagine"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ce8179fd03863ed18174e015e83c3aa64475a8e48a577cbc9ece759206d9a4e4f9006cba62bf29ca2027df937ae9071a8c18d7ac817131190f345d2bb972b19f')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "$srcdir"/${_pkgname}-$pkgver
  python setup.py build

  cd "$srcdir"/${_pkgname}-$pkgver-py2
  python2 setup.py build
}

package_python-pandoc-imagine() {
  depends=('python-pandocfilters>=1.4' 'python-six>=1.10')
  
  cd pandoc-imagine-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pandoc-imagine() {
  depends=('python2-pandocfilters>=1.4' 'python2-six>=1.10')

  cd pandoc-imagine-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/${_pkgname}{,2}
}
