# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=unicodeit-gtk
pkgver=1.2.6
pkgrel=1
pkgdesc="A GTK IME popup for entering symbols via (La)TeX"
url='https://github.com/v--/unicodeit-gtk'
arch=('any')
license=('Unlicense')
makedepends=(git python-build python-installer python-wheel)
depends=(gtk4 python python-gobject python-unicodeit python-setproctitle wtype)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90950a5eb188b0c0839d22eaf485e5ac96d5c90687e18c935c809ce2ec4c45c2')

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
