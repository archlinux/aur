# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.3.0
pkgrel=3.314
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-uv-build python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-pydantic python-pyxdg python-pyicu python-wcmatch)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('121003025a7b8a7f2338155276b99877f26bb8c3222cf189baed343b904a81ca')

_fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    make build-c
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 dist/searchtool-gtk-activate "$pkgdir/usr/bin/searchtool-gtk-activate"
    install -D -m755 dist/searchtool-gtk-dmenu "$pkgdir/usr/bin/searchtool-gtk-dmenu"
    install -D -m644 searchtool.toml "$pkgdir/etc/xdg/searchtool.toml"
}
