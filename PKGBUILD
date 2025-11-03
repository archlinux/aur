# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=Cirq
pkgbase=python-cirq
_packages=(
    python-cirq-aqt
    python-cirq-core
    python-cirq-google
    python-cirq-ionq
    python-cirq-pasqal
    python-cirq-web
)
pkgname=(
    python-cirq
    ${_packages[@]}
)
pkgver=1.6.1
pkgrel=1
pkgdesc="A framework for creating, editing, and invoking Noisy Intermediate Scale Quantum (NISQ) circuits"
arch=(any)
url=https://github.com/quantumlib/Cirq
license=(Apache-2.0)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_name::git+https://github.com/quantumlib/Cirq#tag=v$pkgver)
b2sums=('dc62bbf21a5347b3cfb71d779057e03cdbdad9cf10d9dfbaf585c93d5aab271be36492766a68ca12fb9ae6b54a4a11c5c6807a5709c11b558b83c25b21558bee')

build() {
    cd $_name
    for _package in ${_packages[@]}; do
        cd $srcdir/$_name/${_package:7} # remove "python-"
        python -m build --wheel --no-isolation
    done
}

package_python-cirq() {
    depends=(${_packages[@]})
}

package_python-cirq-aqt() {
    depends+=(python-requests)
    cd $_name/cirq-aqt
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-core() {
    depends+=(
        python-attrs
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
    cd $_name/cirq-core
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-google() {
    depends+=(
        python-google-api-core
        python-grpcio
        python-protobuf
        python-proto-plus
        python-typedunits
    )
    cd $_name/cirq-google
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-ionq() {
    depends+=(python-requests)
    cd $_name/cirq-ionq
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-pasqal() {
    depends+=(python-requests)
    cd $_name/cirq-pasqal
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-web() {
    cd $_name/cirq-web
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
