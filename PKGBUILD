pkgname=graphify-bin
pkgver=0.8.26
pkgrel=1
pkgdesc="AI coding assistant skill - turn any folder into a queryable knowledge graph"
arch=(x86_64 aarch64)
url="https://graphify.net"
license=(MIT)
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
depends=("python>=3.10" "python" "python-pip")
provides=(graphify)

source=("https://files.pythonhosted.org/packages/source/g/graphifyy/graphifyy-0.8.26.tar.gz")
sha256sums=('1d6813e2f299abcbcf10879fddf977bf59820f597e42fe276f81b9b9e985e367')

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