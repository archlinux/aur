# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov at gmail dot com>

pkgname=python-pyramid
pkgver=2.0
pkgrel=1
pkgdesc='A very general open source Python web framework.'
arch=('any')
url='https://github.com/Pylons/pyramid'
license=('custom')
depends=('python-hupper>=1.5'
         'python-plaster'
         'python-plaster-pastedeploy'
         'python-translationstring>=0.4'
         'python-venusian>=1.0'
         'python-webob>=1.8.3'
         'python-zope-deprecation>=3.5.0'
         'python-zope-interface>=3.8.0')
makedepends=('python-webtest'
             'python-zope-component'
             'python-nose'
             'python-virtualenv'
             'python-repoze.lru'
             'python-setuptools')
optdepends=('python-pyramid-debugtoolbar: development mode'
            'python-pastedeploy: pserve/pcreate'
            'python-chameleon: pserve/pcreate'
            'python-waitress: pserve/pcreate')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('352f4a2b112084dccaafe6d5189ebc43616a4de04d03e2465b31dc22f8666439')

build() {
  cd pyramid-$pkgver
  python setup.py build
}

check() {
  cd pyramid-$pkgver
  # this fails because testing can be done only once pyramid is installed...
  # nosetests
}

package() {
  cd pyramid-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -D LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
