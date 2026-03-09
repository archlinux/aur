# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-blackjax
_pkgname=${pkgname#python-}
pkgver=1.3
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
sha256sums=('6814d09aa963b821c961844a61ac5b9925f21d19ad2ebc741320ceae0d4dbcb5')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver*.whl
}
