# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.0.0
pkgrel=1
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-pydantic python-pyxdg)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b1c7a24c375e5b8d14b1fafa4be61f10462d99260e700d75b5d4947cde35b94')

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
