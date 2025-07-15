# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=unicodeit-gtk
pkgver=1.2.3
pkgrel=2
pkgdesc="A GTK IME popup for entering symbols via (La)TeX"
url='https://github.com/v--/unicodeit-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-unicodeit python-setproctitle wtype)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d75008b7004e08e51ee28a8dfed98e09ef6ed00cd605bbc8a1a09bfc7c2c94e')

_fullsrcdir() {
    echo "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/unicodeit-gtk "$pkgdir/usr/bin/unicodeit-gtk"
    install -D -m755 bin/unicodeit-gtk-server "$pkgdir/usr/bin/unicodeit-gtk-server"
}
