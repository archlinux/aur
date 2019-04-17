# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-apprise
pkgname=('python-apprise' 'python2-apprise')
_name=${pkgname#python-}
pkgver=0.7.6
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/caronc/apprise"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1bbb92bea04097569f5641935672456d1128f3811f934d389c622b63b9a25ce6')

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
           'python-markdown'
           'python-yaml')

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
           'python2-markdown'
           'python2-yaml')

  cd apprise-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
