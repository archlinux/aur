# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-qpid-proton
pkgver=0.39.0
pkgrel=1
pkgdesc="An AMQP based messaging library"
arch=(any)
url="http://qpid.apache.org/proton/"
license=('Apache-2.0')
depends=('python'
         'python-cffi'
         'libsasl'
         'openssl'
         'gcc-libs')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('ca36f7b76b1b97d742494b7d28aa41eb52be8c6c6c0d3f30137c2b908e5774741f866d31ca09e2d796211b1dd5af8a4c0cb51fd3eaa3f5b269becae4cae78796')

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
    sphinx-build docs build --builder man
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm 644 "build/qpidprotonpythonapi.1" -t "$pkgdir/usr/share/man/man1/"
}
