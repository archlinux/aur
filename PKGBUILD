# Maintainer: Aisylu <@wonderfox@disroot.org>
pkgname=pharm-record
pkgver=0.4
pkgrel=1
pkgdesc="A PySide6-based medication tracking application."
arch=('any')
url="https://codeberg.org/wonderfox/pharm-record/"
license=('CC-BY-SA-4.0')
depends=('python' 'python-platformdirs' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/wonderfox/pharm-record/archive/v$pkgver.tar.gz")
sha256sums=('0f20c6c8f8320670c9d59c1726faeae28437b279a03aaac625e2b1da3f35017b')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 pharm-record.desktop "$pkgdir/usr/share/applications/pharm-record.desktop"
    install -Dm644 pharm-record.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pharm-record.png"

}
