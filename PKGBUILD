# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=searchtool-gtk
pkgver=2.3.1
pkgrel=2.314
pkgdesc='A generic GTK search tool and launcher'
url='https://github.com/v--/searchtool-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git make gcc python-uv-build python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-pydantic python-pyxdg python-pyicu python-wcmatch)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95d69e5e41ec186137fb18419ffb71bd0d3f622f4d0fd09a614551c80b11df95')

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
