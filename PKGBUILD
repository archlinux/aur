# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=deltachat-cursed
pkgver=0.9.0
pkgrel=1
pkgdesc="Delta Chat client for the command line"
url="https://github.com/adbenitez/deltachat-cursed"
depends=(python-notify-py python-urwid_readline python-deltachat2 python-emoji)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/9f/3f/0acb29bbb76720a1071809b2118cc5b1e734f8d6ddf08b5904c4d594a5e4/deltachat-cursed-${pkgver}.tar.gz")
sha256sums=('3a8f7e061f591a9091ae437a91a845de5ffb792719d0f1e644aa7e846250886d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # avoid conflict with community/git-delta
    rm "${pkgdir}/usr/bin/delta"
    install -Dm644 docs/user-guide.md "${pkgdir}/usr/share/doc/deltachat-cursed/user_guide.md"
}
