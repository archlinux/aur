# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=1.2.1
pkgrel=1
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-build python-installer python-wheel dmd dub)
depends=(gtk4 python python-gobject python-jsonschema python-pyxdg python-referencing)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b847c0ffb8ec075688221012676d92dff6949aae9ffd1eb8f9f515582171919f')

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
