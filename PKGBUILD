# Maintainer: Your Name <youremail@domain.com>
_name=elrond-sdk-erdpy
pkgname=python-erdpy
pkgver=1.0.21
pkgrel=2
pkgdesc="Elrond Smart Contracts Tools and Python SDK."
arch=('any')
url="https://docs.elrond.com/sdk-and-tools/erdpy/erdpy/"
license=('GPL3')
depends=('python>=3.6.8'
         'python-toml>=0.10.2'
         'python-bottle'
         'python-requests'
         'python-pynacl'
         'python-pycryptodomex'
         'python-cryptography>=3.2'
         'python-prettytable'
         'python-ledgercomm'
         'python-semver')
makedepends=('python-setuptools')
source=("https://github.com/ElrondNetwork/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
        '01-use-xdg-paths.patch')
sha256sums=('473fcb8548c928aacb0666a075c4e680735ccf589fa4a4bc0750d76afd87c2a9'
            '8ea349df6745db6a01873b5c43f29457428fdfcd7b2003d15fdd6cde064f91aa')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch -p1 -i "${srcdir}/01-use-xdg-paths.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install \
    --root="$pkgdir" \
    --optimize=1
}
