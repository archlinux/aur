# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-pylibravatar
pkgver=2.0.2
pkgrel=1
pkgdesc='Python module to make use of the federated Libravatar avatar hosting service'
arch=('any')
url='https://github.com/libravatar/pylibravatar'
license=('MIT')
depends=('python-dnspython')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('bbe246dce9328e5b1a9c711e596b4162b0a89f5bea4e94b227ef1d2d30803144f8a534320dc088b9129208d8f509f63a440e9e229790f9dc062849fed9782b34')

build() {
    cd pylibravatar-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd pylibravatar-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*whl

    mkdir -p "${pkgdir}"/usr/share/licenses/$pkgname
    tail -n21 "${srcdir}"/pylibravatar-$pkgver/README.md > "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
