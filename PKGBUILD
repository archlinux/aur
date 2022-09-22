# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python2-dnspython
pkgver=1.16.0
pkgrel=3
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('ISC')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-idna' 'python2-pycryptodome' 'python2-ecdsa' 'python2-typing')
optdepends=('python2-ecdsa: DNSSEC support'
            'python2-pycryptodome: DNSSEC support'
            'python2-idna: support for updated IDNA 2008')
source=("http://www.dnspython.org/kits/${pkgver}/dnspython-${pkgver}.tar.gz"{,.asc})
sha256sums=('4bf5c5c12a4478ee7860ab176659cf64c4899ee76752d826b082f8af723c5cf9'
            'SKIP')
validpgpkeys=('A580DEE052FEC78D8ACF383DF24B3AFC8CA2F5C7') # Bob Halley <halley@dnspython.org>

build() {
    cd "${srcdir}"/dnspython-${pkgver}

    python2 setup.py build
}

check() {
    cd "${srcdir}"/dnspython-${pkgver}

    python2 setup.py test
}

package() {
    cd "${srcdir}"/dnspython-${pkgver}

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
