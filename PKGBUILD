# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-pyngus
pkgver=2.3.1
pkgrel=4
pkgdesc="A connection oriented messaging framework using QPID Proton"
arch=(any)
url="https://github.com/kgiusti/pyngus"
license=('Apache-2.0')
depends=('python'
         'python-qpid-proton')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('ee1aa0110e8f331c97eaeaa11929e2fe645bb4df03111df6f2a67a246668b24b3f1f9fef78012f039282c60733af167da3bc748a1b128597bc83a75e7c17f445')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
}
