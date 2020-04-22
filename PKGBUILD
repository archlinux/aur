# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.
# If one is not installed, the maturin build tool will automatically download one.

pkgname=python-blake3
pkgver=0.1.4
pkgrel=1
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('08a2a5d04c5230f093e3e14f20f044cfad79328f92878821c5f21a6f5b170cb5f461e77531aa553ee30be4f2aa722a2fac7cfe8e8cb9260cb4fb99aa3daf16ad')

package() {
    cd "blake3-py-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" --isolated --ignore-installed --no-deps --no-binary=blake3 --use-pep517 .
}
