# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgbase="python-sacred"
pkgname=("python-sacred" "python2-sacred")
_pkgname="sacred"
pkgver="0.7.4"
pkgrel="1"
pkgdesc='Sacred is a tool to configure, organize, log and reproduce computational experiments.'
arch=('any')
url='https://github.com/IDSIA/sacred'
license=('MIT')
depends=('python' 'python-docopt' 'python-wrapt' 'python-jsonpickle' 'python-mock' 'python-munch' 'python-py' 'python-pbr' 'python-pytest' 'python-py-cpuinfo'
         'python2' 'python2-docopt' 'python2-wrapt' 'python2-jsonpickle' 'python2-mock' 'python2-munch' 'python2-py' 'python2-pbr' 'python2-pytest')
makedepends=('python-distribute'
             'python2-distribute')
optdepends=('python-numpy' 'python-pymongo'
            'python2-numpy' 'python2-pymongo')
source=("https://files.pythonhosted.org/packages/78/7c/07dc814c4e2edd516a323785fdf523c6b08db563c654bd5f11d8453ef9e7/sacred-${pkgver}.tar.gz")
md5sums=('3b19ff7cb69d3d1593f004bfd06c0e99')

prepare() {
  cd "$srcdir/"
  cp -a "$_pkgname-$pkgver" "$_pkgname-$pkgver-py2"
  cd "$_pkgname-$pkgver"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/$_pkgname-$pkgver-py2"
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package_python2-sacred() {
  depends=('python2' 'python2-docopt' 'python2-wrapt' 'python2-jsonpickle' 'python2-mock' 'python2-munch' 'python2-py' 'python2-pbr' 'python2-pytest')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

package_python-sacred() {
  depends=('python' 'python-docopt' 'python-wrapt' 'python-jsonpickle' 'python-mock' 'python-munch' 'python-py' 'python-pbr' 'python-pytest' 'python-py-cpuinfo')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
