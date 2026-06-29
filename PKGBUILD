# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=siphashc
pkgname=python-siphashc
pkgver=2.7
pkgrel=1
pkgdesc="Python module (in c) for siphash-2-4"
url="https://github.com/WeblateOrg/siphashc"
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer')
checkdepends=('python-wheel')
license=('ISC')
arch=('x86_64' 'aarch64')
source=("${url}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('6cb844855358e6b879cde8f6945784aec026db8900f18bdd836329969255f2fad03dfb33b4e3a7d8af57724bc7ace06c75b16c51bec83212ffe50b068317aa62')

build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
