# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-blackjax
_pkgname=${pkgname#python-}
pkgver=1.2.5
pkgrel=1
pkgdesc='Bayesian Inference library designed for ease of use, speed and modularity.'
arch=('any')
url='https://github.com/blackjax-devs/blackjax'
license=('Apache')
groups=('jax')
depends=(
    'python-fastprogress'
    'python-jax'
    'python-jaxlib'
    'python-optax'
    'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8fedfc8de2ad33e4c170de4648d8301374e386fd68d8db91bf03f1bd2d0f5e97')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
