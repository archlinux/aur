# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-qpid-proton
pkgver=0.39.0
pkgrel=2
pkgdesc="An AMQP based messaging library"
arch=(x86_64)
url="http://qpid.apache.org/proton/"
license=('Apache-2.0')
depends=('python'
         'libsasl'
         'openssl'
         'gcc-libs'
         'glibc')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'python-sphinx'
             'python-cffi')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('ca36f7b76b1b97d742494b7d28aa41eb52be8c6c6c0d3f30137c2b908e5774741f866d31ca09e2d796211b1dd5af8a4c0cb51fd3eaa3f5b269becae4cae78796')

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
    sphinx-build docs docs/build --builder man
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "docs/build/qpidprotonpythonapi.1" -t "$pkgdir/usr/share/man/man1/"
}
