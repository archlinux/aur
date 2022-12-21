# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Cirq
pkgbase=python-cirq
_packages=(
    python-cirq-aqt
    python-cirq-core
    python-cirq-google
    python-cirq-ionq
    python-cirq-pasqal
    python-cirq-rigetti
    python-cirq-web
)
pkgname=(
    python-cirq
    ${_packages[@]}
)
pkgver=1.1.0
pkgrel=4
pkgdesc='A framework for creating, editing, and invoking Noisy Intermediate Scale Quantum (NISQ) circuits.'
arch=(any)
url='https://github.com/quantumlib/Cirq'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('97106c6ab848b5e6139c6c6a3408c5539452cb6d57fb7e2de5862d1153e9849530589c3828a08e46e0a0ae9e0a1913d78bf66c90347f9b1a376f974c075cff4e')

build() {
    cd $_name-$pkgver
    for _package in ${_packages[@]}; do
        cd $srcdir/$_name-$pkgver/${_package:7} # remove "python-"
        python -m build --wheel --no-isolation
    done
}

package_python-cirq() {
    depends=(${_packages[@]})
}

package_python-cirq-aqt() {
    depends+=(python-requests)
    cd $_name-$pkgver/cirq-aqt
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-core() {
    depends+=(
        python-duet
        python-matplotlib
        python-networkx
        python-numpy
        python-pandas
        python-sortedcontainers
        python-scipy
        python-sympy
        python-typing_extensions
        python-tqdm
    )
    cd $_name-$pkgver/cirq-core
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-google() {
    depends+=(
        python-google-api-core
        python-grpcio
        python-proto-plus
        python-protobuf
    )
    cd $_name-$pkgver/cirq-google
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-ionq() {
    depends+=(python-requests)
    cd $_name-$pkgver/cirq-ionq
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-pasqal() {
    depends+=(python-requests)
    cd $_name-$pkgver/cirq-pasqal
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-rigetti() {
    depends+=(python-pyquil)
    cd $_name-$pkgver/cirq-rigetti
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-web() {
    cd $_name-$pkgver/cirq-web
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
