# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-social-auth-core
pkgname=($pkgbase 'python2-social-auth-core')
pkgver=1.2.0
pkgrel=1
pkgdesc='Core component of the python-social-auth ecosystem'
arch=('any')
url='https://github.com/python-social-auth/social-core'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools'
             'python-defusedxml' 'python-six' 'python-pyjwt' 'python-requests-oauthlib' 'python-openid'
             'python2-defusedxml' 'python2-six' 'python2-pyjwt' 'python2-requests-oauthlib' 'python2-openid')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/python-social-auth/social-core/archive/$pkgver.tar.gz")
sha256sums=('e36e86cb950961d106180765c4ffcbc674d1014b8bb233fac5c0493b5cf14d9d')

prepare() {
    cp -r social-core-$pkgver social-core-$pkgver-python2
}

build() {

    cd $srcdir/social-core-$pkgver
    python setup.py build

    cd $srcdir/social-core-$pkgver-python2
    python2 setup.py build

}

package_python-social-auth-core() {

    depends=('python-defusedxml' 'python-six' 'python-pyjwt' 'python-requests-oauthlib' 'python-openid')

    cd social-core-$pkgver
    python setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/social-core-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-social-auth-core() {

    depends=('python2-defusedxml' 'python2-six' 'python2-pyjwt' 'python2-requests-oauthlib' 'python2-openid')

    cd social-core-$pkgver-python2
    python2 setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/social-core-$pkgver-python2/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
