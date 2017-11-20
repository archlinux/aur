# Maintainer: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.14.2
pkgrel=1
pkgdesc="Generate secure multiword passwords/passphrases, inspired by XKCD"
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
optdepends=('cracklib: alternative wordlist'
            'words: alternative wordlist')
options=(!emptydirs)
source=("https://github.com/redacted/XKCD-password-generator/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c8b4afcc834db61929d6a3d97a8b031b831466a1b6362be1778dd814d5d18be0')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
	nosetests tests
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -m644 -D LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
