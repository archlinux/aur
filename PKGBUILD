# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>

pkgname=python-dnspython-git
pkgver=2.0.0rc2
pkgrel=1
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('ISC')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'python-setuptools'
    # 'cython'  # uncomment dep & build option for cython optimization speedup
)
depends=('python')
optdepends=(
    'python-idna: support for update IDNA 2008'
    'python-cryptography: DNSSEC support'
    'python-requests: DNS-over-HTTPS support'
    'python-requests-toolbelt: DNS-over-HTTPS support'
    'python-trio: async I/O backend'
    'python-curio: async I/O backend'
    'python-sniffio: async I/O'
)
source=("https://github.com/rthalley/dnspython/archive/v${pkgver}.tar.gz")
sha256sums=('c588b132eefaf7d0892a3b0aa863b990264f08811ae4b0d4d6e6b62086c3de18')

build() {
    cd "${srcdir}"/dnspython-${pkgver}

    python setup.py build  # --cython-compile
}

package() {
    cd "${srcdir}"/dnspython-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
