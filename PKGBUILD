# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=siphashc
pkgname=python-siphashc
pkgver=2.9.1
pkgrel=1
pkgdesc="Python module (in c) for siphash-2-4"
url="https://github.com/WeblateOrg/siphashc"
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer')
license=('ISC')
arch=('x86_64' 'aarch64')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('896dfa67d1839a60cd3b79342980b40fb12065abffcbf344f5571479c9a8a6ef3815cd57e41ba73a9057c2a3e24c207757b77665631db69ab435423668469e1b')

build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
