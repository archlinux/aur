# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=1.3.0
pkgrel=1
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-jsonschema python-pyxdg python-referencing)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b18035552d60671bc868f7dcf18cd3aaaca47f18e5174ef9311b1106438b7ee8')

fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(fullsrcdir)"
    make bin/searchtool-gtk-activate
    make bin/searchtool-gtk-dmenu
    python -m build --wheel --no-isolation
}

package() {
    cd "$(fullsrcdir)"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/searchtool-gtk-server "$pkgdir/usr/bin/searchtool-gtk-server"
    install -D -m755 bin/searchtool-gtk-activate "$pkgdir/usr/bin/searchtool-gtk-activate"
    install -D -m755 bin/searchtool-gtk-dmenu "$pkgdir/usr/bin/searchtool-gtk-dmenu"
    install -D -m755 searchtool.json.default "$pkgdir/etc/xdg/searchtool.json"
}
