# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=1.1.0
pkgrel=1
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-build python-installer python-wheel)
depends=(python python-gobject python-jsonschema python-pyxdg python-referencing glib2 jq)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f09b219ddc91e25384d8f1db3589eff2bcf290aa465fdd36087d4e5dcf069a6')

fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(fullsrcdir)"
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
