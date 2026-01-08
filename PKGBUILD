# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="dupster"
pkgver=0.0.7
pkgrel=1
pkgdesc="Fast duplicate file finder with interactive TUI"

license=('Apache-2.0')
arch=('any')

url='https://github.com/karimz1/dupster'

provides=("${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-rich' 'python-textual' 'python-typer')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5d266f05cd3ad9a232aea5ea3fa6c4261240fc7147c9c2f113633b663945101')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
