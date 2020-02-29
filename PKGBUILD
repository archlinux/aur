# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.
# If one is not installed, the maturin build tool will automatically download one.

pkgname=python-blake3
pkgver=0.1.0
pkgrel=1
pkgdesc="Python bindings for the Rust blake3 crate, based on PyO3. This a proof of concept, not yet fully-featured or production-ready."
arch=(x86_64 i686)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz"
        'LICENSE-CC0-1.0')
sha512sums=('c864cd85994305f3ad8cc5f3c97693ec3a9e75c882d68d8507bfdc98a1c5f091706193365da6869d5527aa60dc660d6faee74d071bdcae228876b31056cb7c1d'
            '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa')

package() {
    install -Dm644 LICENSE-CC0-1.0 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC0-1.0"

    cd "blake3-py-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" --isolated --ignore-installed --no-deps --no-binary=blake3 --use-pep517 .
}
