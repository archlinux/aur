# Maintainer: kurojs <kuro@kurojs.dev>

pkgname=takoyomi
_realname=Takoyomi
pkgver=1.0.1
pkgrel=1
pkgdesc="Real-time Japanese overlay translator for KDE Plasma"
arch=('any')
url="https://github.com/kurojs/Takoyomi"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kurojs/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    pip install --root="$pkgdir" --prefix=/usr --no-deps deep-translator

    install -Dm644 assets/takoyomi.desktop \
        "$pkgdir/usr/share/applications/takoyomi.desktop"
    install -Dm644 assets/takoyomi.png \
        "$pkgdir/usr/share/pixmaps/takoyomi.png"
}
