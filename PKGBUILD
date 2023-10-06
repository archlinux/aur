# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=unicodeit-gtk
pkgver=1.1.0
pkgrel=1
pkgdesc="A GTK IME popup for entering symbols via (La)TeX"
url='https://github.com/v--/unicodeit-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-build python-installer python-wheel)
depends=(python python-gobject python-unicodeit python-setproctitle wtype)
source=('https://github.com/v--/unicodeit-gtk/archive/refs/tags/v1.1.0.zip')
sha256sums=('93705aa6e8b9c40e836baee083777c7c5bc01770554d3bef827d92212cda0308')

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
    install -D -m755 bin/unicodeit-gtk "$pkgdir/usr/bin/unicodeit-gtk"
    install -D -m755 bin/unicodeit-gtk-daemon "$pkgdir/usr/bin/unicodeit-gtk-daemon"
}
