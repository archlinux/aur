# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
# A DRY template for creating a Python 3 only package that uses setuptools and
# is available on GitHub.

_github_url=https://github.com/lopsided98/dnsupdate
pkgname=dnsupdate-git
pkgver=0.1.r0.gde81e54
pkgrel=1
pkgdesc=""
arch=('any')
url="${_github_url}"
license=('GPL3')
groups=()
depends=('python-requests' 'python-yaml')
makedepends=('python-setuptools')
optdepends=(
     'python-beautifulsoup4: router address scraping'
     'python-netifaces: local interface address support'
)
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
}

# vim:set ts=4 sw=4 et:
