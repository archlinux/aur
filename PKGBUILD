# Maintainer: Víctor Sosa <victor.sosa@gmail.com>
pkgname=vsreflector-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="Visual mirror manager for Arch Linux built with GTK4 and libadwaita"
arch=('any')
url="https://github.com/victorsosaMx/vsReflector-Manager"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit')
optdepends=('reflector: generate optimized mirrorlists'
            'gdk-pixbuf2: PNG icon in About tab')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorsosaMx/vsReflector-Manager/archive/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

package() {
    cd "$srcdir/vsReflector-Manager-$pkgver"

    # Python package
    _site=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/$_site"
    cp -r vs_reflector_manager "$pkgdir/$_site/"

    # Launcher
    install -Dm755 vsreflector-manager "$pkgdir/usr/bin/vsreflector-manager"

    # Desktop entry
    install -Dm644 vsreflector-manager.desktop \
        "$pkgdir/usr/share/applications/vsreflector-manager.desktop"

    # Icon
    install -Dm644 vsreflector-manager.png \
        "$pkgdir/usr/share/pixmaps/vsreflector-manager.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
