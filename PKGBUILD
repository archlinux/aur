# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.1.0
pkgrel=1
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-pydantic python-pyxdg)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2eee16472a8504ed2cc1c7c25d3f50ebb826550b9bc6308e3efbe57f6633c60f')

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
