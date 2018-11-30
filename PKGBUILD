# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-apprise
pkgname=('python-apprise' 'python2-apprise')
pkgver=0.5.2
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/caronc/apprise"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/caronc/apprise/archive/v$pkgver.tar.gz")
sha256sums=('e53b898836349fe449b156dea3bde8a0774be89cebf0c68ace9b8485b90e3a91')

prepare() {
  cp -a apprise-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/apprise-$pkgver
  python setup.py build

  cd "$srcdir"/apprise-$pkgver-py2
  python2 setup.py build
}

package_python-apprise() {
  depends=('python-decorator'
           'python-requests'
           'python-requests-oauthlib'
           'python-oauthlib'
           'python-urllib3'
           'python-six'
           'python-click'
           'python-markdown')

  cd apprise-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-apprise() {
  depends=('python2-decorator'
           'python2-requests'
           'python2-requests-oauthlib'
           'python2-oauthlib'
           'python2-urllib3'
           'python2-six'
           'python2-click'
           'python2-markdown')

  cd apprise-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
