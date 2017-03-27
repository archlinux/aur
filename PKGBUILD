# Maintainer: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.9.4
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
sha256sums=('2f3b63a28db1ddc04c32f3769088a79ae5b99e5ce3eaf5436e96212cd28afb3d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
	nosetests tests --exclude test_loadwordfile # Broken test in 1.9.4, issue #65
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -m644 -D LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
}
