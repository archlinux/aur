# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator
pkgver=1.16.5
pkgrel=1
pkgdesc='Generate secure multiword passwords/passphrases, inspired by XKCD'
arch=('any')
url='https://github.com/redacted/XKCD-password-generator'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
optdepends=('cracklib: alternative wordlist'
            'words: alternative wordlist')
options=(!emptydirs)
source=("https://github.com/redacted/${_pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7778cc8924273a3f8313888817dc37dc845a838b5f42f0c5ab0267b2adddebff')

build() {
    cd ${_pkgname}-${pkgname}-${pkgver}
    python setup.py build
}

check() {
    cd ${_pkgname}-${pkgname}-${pkgver}
    nosetests tests
}

package() {
    cd ${_pkgname}-${pkgname}-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
    install -m644 -D LICENSE.BSD ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -m644 -D xkcdpass.1 ${pkgdir}/usr/share/man/man1/xkcdpass.1
}
