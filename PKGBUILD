# Maintainer: kurojs <kuro@kurojs.dev>
# Contributor: kurojs <kuro@kurojs.dev>

pkgname=n1-translator
pkgver=1.0.0
pkgrel=1
pkgdesc="Real-time Japanese->Spanish overlay translator for KDE Plasma"
arch=('any')
url="https://github.com/kurojs/n1-translator"
license=('MIT')
depends=(
    'pyside6'
    'wl-clipboard'
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-pip'
    'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kurojs/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    pip install --root="$pkgdir" --prefix=/usr --no-deps deep-translator

    install -Dm644 assets/n1-translator.desktop \
        "$pkgdir/usr/share/applications/n1-translator.desktop"
    install -Dm644 assets/n1-translator.png \
        "$pkgdir/usr/share/pixmaps/n1-translator.png"
}
