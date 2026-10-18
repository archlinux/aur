# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=arcanechat-tui
_pkgname=arcanechat_tui
pkgver=0.12.0
pkgrel=1
pkgdesc="ArcaneChat (Delta Chat) client for the command line (formerly deltachat-cursed)"
url="https://github.com/ArcaneChat/arcanechat-tui"
depends=(python python-deltachat2 python-urwid python-urwid_readline python-appdirs deltachat-rpc-server)
makedepends=('python-setuptools' 'python-setuptools-scm>=8' 'python-build' 'python-installer' 'python-wheel')
provides=(deltachat-cursed)
conflicts=(deltachat-cursed)
replaces=(deltachat-cursed)
license=('GPL-3.0-only')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bd78452ac05da78885eb1ede7f8b291a447d893a1fb826df7a6f117e6f06bfcd')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/user-guide.md "${pkgdir}/usr/share/doc/${pkgname}/user-guide.md"
}
