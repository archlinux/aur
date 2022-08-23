# Maintainer: thepasto <thepasto@gmail.com>

pkgname=certbot-dns-dynu
pkgver=0.0.3
pkgrel=1
pkgdesc="Dynu DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/bikram990/${pkgname}"
license=('Apache')
depends=('certbot' 'python' 'dns-lexicon' 'python-zope-interface' 'python-dnspython' 'python-requests' 'python-mock')
makedepends=('python-setuptools')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49c9e696ce38aa747e20003c9b56864864b3642cdfabf3ed79374231a05e965e')

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

