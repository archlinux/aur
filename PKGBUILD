# Maintainer: Étienne Pflieger <etienne@pflieger.bzh>
pkgname=edgar-ssh
_upname=edgar
pkgver=6.0
pkgrel=1
pkgdesc="A small utility to maintain SSH config files"
arch=("any")
url="https://git.umaneti.net/${_upname}/about/"
license=("WTFPL")
depends=("python" "python-yaml")
makedepends=("python-flit-core" "python-build" "python-installer" "python-wheel")
source=("https://git.umaneti.net/${_upname}/snapshot/${_upname}-${pkgver}.tar.gz")
sha256sums=('fb5fcc96cc271f0de76df0057f78c065f3520307aad6102fbb5417ae256f081f')

build() {
    cd "${_upname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_upname}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${_upname}-${pkgver}-py3-none-any.whl"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_upname}/LICENSE"
}
