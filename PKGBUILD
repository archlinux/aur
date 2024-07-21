# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=1.4.0
pkgrel=2
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-jsonschema python-pyxdg python-referencing)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbbe930f00538460079354e03cbecff004beaae5a1a7248fd6f827c3a1ce6e67')

_fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    make bin/searchtool-gtk-activate
    make bin/searchtool-gtk-dmenu
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/searchtool-gtk-server "$pkgdir/usr/bin/searchtool-gtk-server"
    install -D -m755 bin/searchtool-gtk-activate "$pkgdir/usr/bin/searchtool-gtk-activate"
    install -D -m755 bin/searchtool-gtk-dmenu "$pkgdir/usr/bin/searchtool-gtk-dmenu"
    install -D -m644 searchtool.json.default "$pkgdir/etc/xdg/searchtool.json"
}
