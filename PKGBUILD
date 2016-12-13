# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_github_url=https://github.com/lopsided98/dnsupdate
pkgname=dnsupdate-git
pkgver=0.1.r0.gde81e54
pkgrel=3
pkgdesc="A modern and flexible dynamic DNS client"
arch=('any')
url="${_github_url}"
license=('GPL3')
depends=('python-requests' 'python-yaml')
makedepends=('python-setuptools')
optdepends=(
     'python-beautifulsoup4: router address scraping'
     'python-netifaces: local interface address support'
)
conflicts=('dnsupdate')
provides=('dnsupdate')
source=(${pkgname}::git+${_github_url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 dnsupdate.service -t "${pkgdir}/usr/lib/systemd/system/"
}

# vim:set ts=4 sw=4 et:
