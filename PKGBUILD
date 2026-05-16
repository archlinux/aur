# Maintainer: Your Name <your.email@example.com>
# Contributor: Your Name <your.email@example.com>

pkgname=piperdc-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern RDP Connection Manager for Linux"
arch=('x86_64')
url="https://github.com/dariusjeleru/piperdc"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'freerdp' 'python-gobject' 'python-secretstorage')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    cd "$srcdir/piperdc-$pkgver"

    # Install Python package
    python -m build --wheel --outdir dist
    python -m installer --prefix=/usr --destdir="$pkgdir" dist/*.whl

    # Install desktop file
    install -Dm644 data/piperdc.desktop "$pkgdir/usr/share/applications/piperdc.desktop"

    # Install icon
    install -Dm644 data/icons/piperdc.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/piperdc.svg"

    # Create symlink for CLI
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/usr/bin/piperdc" "$pkgdir/usr/bin/piperdc"
}