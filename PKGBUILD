# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.3.0
pkgrel=1.314
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-uv-build python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-pydantic python-pyxdg python-pyicu python-wcmatch)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0453b965ccf97a58f5486123d0d0e9094236182830ab4bfe1d5c8444b0d1f955')

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
    install -D -m644 searchtool.json.default "$pkgdir/etc/xdg/searchtool.json"
}
