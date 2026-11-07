# Maintainer: tomsh <tomsh@disroot.org>
pkgname=yamep
pkgver=2.1.1
pkgrel=1
pkgdesc="Yet Another Markdown Editor & Preview"
arch=('any')
url="https://github.com/itstomsh/yamep"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'qt6-webengine' 'python-markdown' 'python-platformdirs' 'python-pymdown-extensions' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itstomsh/yamep/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c20109750caf819ec2db75e107295ded85a5d1a751e6ef419af7f11e1d8c82d7')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 flatpak/io.github.itstomsh.yamep.desktop \
        "$pkgdir/usr/share/applications/io.github.itstomsh.yamep.desktop"
    install -Dm644 flatpak/io.github.itstomsh.yamep.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.itstomsh.yamep.png"
    install -Dm644 flatpak/io.github.itstomsh.yamep.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.itstomsh.yamep.metainfo.xml"
}
