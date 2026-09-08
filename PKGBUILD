# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-blackjax
_pkgname=${pkgname#python-}
pkgver=1.6.2
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
sha256sums=('ad3c97ff6c77cfa17310a68de665d1a48f9d47ff1ac39725082ab235517406ee')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
