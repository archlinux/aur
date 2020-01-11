# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-wasmtime
pkgver=0.9.0
pkgrel=1
pkgdesc="Python 3 extension for interface with Wasmtime/Cranelift."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/bytecodealliance/wasmtime"
license=('APACHE2')
depends=('python' 'python-setuptools' 'python-wheel' 'python-setuptools-rust')
makedepends=('rustup')
options=(!emptydirs)
source=("${pkgname}-${pkgver}::git+https://github.com/bytecodealliance/wasmtime.git#tag=v${pkgver}")
sha384sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git submodule update --init --recursive
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/crates/misc/py"
    rustup run nightly python setup.py install --root="$pkgdir/" --optimize=1
}
