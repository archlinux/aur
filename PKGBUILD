# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-blackjax
_pkgname=${pkgname#python-}
pkgver=1.5
pkgrel=1
pkgdesc='Bayesian Inference library designed for ease of use, speed and modularity.'
arch=('any')
url='https://github.com/blackjax-devs/blackjax'
license=('Apache')
groups=('jax')
depends=(
    'python-jax'
    'python-jaxlib'
    'python-numpy'
    'python-optax'
    'python-scipy'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=('python-fastprogress: progress bars')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c4a9898d4f5340894301cd382c28d72790e38847edaf4cfc9584dbd47bd205e1')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
