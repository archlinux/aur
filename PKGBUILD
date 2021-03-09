# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-wasmtime
pkgver=0.24.0
pkgrel=1
pkgdesc="Python 3 extension for interface with Wasmtime/Cranelift."
arch=('x86_64' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime-py"
license=('APACHE2')
depends=('python' 'python-setuptools' 'python-wheel' 'wasmtime')
options=(!emptydirs)
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime-py.git#tag=${pkgver}")
sha384sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git submodule update --init --recursive
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    PP="${pkgdir}/""$(python -c "import setuptools as _; print(_.__path__[0][:-10])")""wasmtime/""linux-$(uname -m)"
    mkdir "${PP}"
    ln -sf "/usr/lib/libwasmtime.so" "${PP}/_libwasmtime.so"
}
