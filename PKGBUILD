pkgname=graphify-bin
pkgver=0.9.77
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder into a queryable knowledge graph"
arch=(x86_64 aarch64)
url="https://graphify.net"
license=(MIT)
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python>=3.10" "python" "python-pip")
conflicts=("graphifyy")
provides=(graphify)

source=("https://files.pythonhosted.org/packages/source/g/graphifyy/graphifyy-0.9.77.tar.gz")
sha256sums=('6571369e9ae9a1eee0a918b7f90eb93de8645a512b474652d2dccbffa932b897')

build() {
    cd "${srcdir}/graphifyy-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/graphifyy-${pkgver}"
    python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/graphify-bin"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/graphify-bin"
}