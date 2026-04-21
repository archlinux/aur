# Maintainer: Your Name <your.email@example.com>
pkgname=muzlib-desktop
pkgver=0.1
pkgrel=1
pkgdesc="Music Downloader"
arch=('any')
url="https://github.com/ezvezdov/muzlib-desktop"
license=('GPL3')

depends=(
    'python>=3.10'
    'python-muzlib'
    'pyside6'
    'qt6-svg'
)

# Tools needed to build the package
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

source=("git+https://github.com/ezvezdov/muzlib-desktop.git")
md5sums=('SKIP')

build() {
    # cd into downloaded git repository
    cd $srcdir/$pkgname

    # Build the python package (wheel) without creating an isolated environment
    python -m build --wheel --no-isolation
}

package() {

    # Installs the Python package into the Arch package directory
    python -m installer --destdir="$pkgdir" $srcdir/muzlib-desktop/dist/*.whl

    # Install the desktop file
    install -Dm644 "$srcdir/muzlib-desktop/deploy/linux/muzlib-desktop.desktop" "$pkgdir/usr/share/applications/muzlib-desktop.desktop"

    # Install the icon
    install -Dm644 "$srcdir/muzlib-desktop/src/muzlib_desktop/resources/icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/muzlib-desktop.svg"
}
