# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator
pkgver=1.16.2
pkgrel=2
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
sha256sums=('be1aff73a07226b22e21e31f40f6f51f87ebeaa15cf92260aebb0105a2e5bb73')

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
