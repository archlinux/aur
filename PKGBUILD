# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=mdremotifier
pkgver=0.5.0
pkgrel=1
pkgdesc="Remotify local links in Markdown"
arch=("any")
url="https://github.com/realazthat/mdremotifier"
license=("MIT")
depends=("python" "python-mistletoe" "python-beautifulsoup4" "python-rich" "python-rich-argparse" "python-typing_extensions" "python-colorama")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realazthat/mdremotifier/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("deb556f6c93627d15b79feb7f8f943144b9b373e2269981902a3ab42a96b7217")

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
