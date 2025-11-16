# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-qpid-proton
pkgver=0.40.0
pkgrel=1
pkgdesc="An AMQP based messaging library"
arch=(x86_64)
url="http://qpid.apache.org/proton/"
license=('Apache-2.0')
depends=(
    'python'
    'libsasl'
    'openssl'
    'gcc-libs'
    'glibc'
    'python-opentracing'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-sphinx'
    'python-cffi'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
b2sums=('28960eefb632eaf962f3a078a355ea939e0ef6c040fdab60683b8f343635c49f203db663d964e2ae4c9171625563f737153c7323cca9af914e99c164710ad990')

build(){
    cd "${pkgname//-/_}-$pkgver" || exit
    python -m build --wheel --no-isolation
    sphinx-build docs docs/build --builder man
}

package(){
    cd "${pkgname//-/_}-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "docs/build/qpidprotonpythonapi.1" -t "$pkgdir/usr/share/man/man1/"
}
