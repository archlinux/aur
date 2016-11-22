# Maintainer: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.9.1
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
sha256sums=('776c11084b6159ead473a43551a2131c0c487edf4afc26021beb98f848b6a433')

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
