# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="dupster"
pkgver=0.0.8
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
sha256sums=('5d5f4440a98923eb98b54588d8a2570d4f4717a5ccd05d8d87ea4f36e67a5044')

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
