# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=unicodeit-gtk
pkgver=1.3.8
pkgrel=1.314
pkgdesc="A GTK IME popup for entering symbols via (La)TeX"
url='https://github.com/v--/unicodeit-gtk'
arch=('any')
license=('Unlicense')
makedepends=(python-uv-build python-build python-installer)
depends=(gtk4 python python-gobject python-unicodeit python-setproctitle wtype)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76b5cbc1088f289b92d4695e049fe810c09721cb028542643632b280efa03f15')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl

    doc_path="/$(realpath --relative-to "$pkgdir" "$pkgdir"/usr/lib/python*/site-packages/unicodeit_gtk-*.dist-info/licenses/LICENSES)"
    mkdir --parents "$pkgdir/usr/share/licenses"
    ln --symbolic $doc_path "$pkgdir/usr/share/licenses/$pkgname"
}
