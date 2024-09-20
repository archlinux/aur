# Maintainer: Pingax <pingax@proton.me>

pkgname=geode-gem
_pkgname=geode_gem
pkgver=0.12.0
pkgrel=2
pkgdesc="GTK+ Graphical User Interface (GUI) for GNU/Linux which allows you to easily manage your emulators and games collection."
arch=('x86_64')
license=('GPL3')
depends=('python-gobject' 'python-pyxdg' 'gtksourceview4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
url="https://geode.kawateam.dev/"
source=(https://archives.kawateam.dev/geode-gem/geode_gem-0.12.0.tar.gz)
sha256sums=('3145b1da96e2f77fc93d646f44e4d541a0bf518bb8efc3fb9dabf8d88e65d61a')

build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 ${_pkgname}/data/desktop/gem.svg "${pkgdir}/usr/share/pixmaps/gem.svg"
    install -Dm 644 ${_pkgname}/data/desktop/gem.desktop "${pkgdir}/usr/share/applications/gem.desktop"

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 ${_pkgname}/data/docs/LICENSE.emulators.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.emulators.md
}
