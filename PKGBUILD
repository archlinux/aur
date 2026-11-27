# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-blackjax-git
_pkgname=${pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=1.7.1.r24.gd58095727
pkgrel=1
pkgdesc='Bayesian Inference library designed for ease of use, speed and modularity (git main)'
arch=('any')
url='https://github.com/blackjax-devs/blackjax'
license=('Apache-2.0')
groups=('jax')
depends=(
    'python-jax'
    'python-jaxlib'
    'python-numpy'
    'python-optax'
    'python-scipy'
    'python-typing_extensions'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    python -m build -nw
}

package() {
    cd $_pkgname
    python -m installer \
        --compile-bytecode 1 \
        --destdir=$pkgdir \
        dist/*.whl
}
