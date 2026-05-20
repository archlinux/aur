pkgname=graphify-bin
pkgver=0.8.14
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder into a queryable knowledge graph"
arch=(x86_64 aarch64)
url="https://graphify.net"
license=(MIT)
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python>=3.10" "python" "python-pip")
provides=(graphify)

source=("https://files.pythonhosted.org/packages/source/g/graphifyy/graphifyy-0.8.14.tar.gz")
sha256sums=('35274777fa80d75b4c3e9fb0aefa99cb595ed8f85d39a9ef047f40d057733a8e')

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