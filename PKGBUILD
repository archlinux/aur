# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pandoc-imagine
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.1.5
pkgrel=3
arch=('any')
license=('MIT')
pkgdesc="Imagine is a pandoc filter that will turn codeblocks tagged with certain classes into images or ascii art.."
url="https://github.com/hertogp/imagine"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d23742823efd5ee9f797b197d7751592e01ed14cd01f99ba11046b8585bb43a5080043541f2152eb7b1e74a65b81c3416d38a9f7dd03321594a8f08e6940a63e')

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
