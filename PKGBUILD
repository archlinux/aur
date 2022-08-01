# Maintainer: thepasto <thepasto@gmail.com>

pkgname=certbot-dns-dynu
pkgver=0.0.2
pkgrel=2
pkgdesc="Dynu DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/bikram990/${pkgname}"
license=('Apache')
depends=('certbot' 'python' 'dns-lexicon' 'python-zope-interface' 'python-dnspython' 'python-requests')
makedepends=('python-setuptools')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d7a175f2f94697593a35d1c28491999d4ed49f0699d7626526837f8725d05803')

prepare() {
        cd "${pkgname}-${pkgver}"
        sed -i 's/dns-lexicon>=3.2.4,<=3.5.6/dns-lexicon>=3.2.4/g' setup.py
}

build() {
        cd "${pkgname}-${pkgver}"
        python setup.py build
}

package() {
        cd "${pkgname}-${pkgver}"
        python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

