pkgname=graphify-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder into a queryable knowledge graph"
arch=(x86_64 aarch64)
url="https://graphify.net"
license=(MIT)
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python>=3.10" "python" "python-pip")
provides=(graphify)

source=("https://files.pythonhosted.org/packages/source/g/graphifyy/graphifyy-0.9.9.tar.gz")
sha256sums=('15dbf9bfb01a6b78d788b2cd516e88849c9161e0bc207e2f1b73a32d88027afd')

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