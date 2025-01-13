# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=mdremotifier
pkgver=1.0.0
pkgrel=1
pkgdesc="Remotify local links in Markdown"
arch=("any")
url="https://github.com/realazthat/mdremotifier"
license=("MIT")
depends=("python" "python-mistletoe" "python-beautifulsoup4" "python-rich" "python-rich-argparse" "python-typing_extensions" "python-colorama")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realazthat/mdremotifier/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6060f903054c9c56b6975b498d1cbcee60745129ef5d277bbe357af9c41fa178")

build() {
    cd "mdremotifier-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "mdremotifier-${pkgver}"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
