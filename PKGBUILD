# Maintainer: Perttu Luukko <perttu.luukko@iki.fi>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.9.0
pkgrel=2
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
sha256sums=('2e28aa1472a8d86db86e0f49d79309d6d0930229b560c876dc22ee57b2516d02')

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
