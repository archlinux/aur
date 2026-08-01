# Maintainer: Jeena <hello@jeena.net>
pkgname=recoder
pkgver=1.1.0
pkgrel=1
pkgdesc="A GTK4 video transcoding GUI application"
arch=('x86_64' 'aarch64')
url="https://git.jeena.net/jeena/recoder"
license=('GPL3')
depends=(
    'gtk4' 
    'libadwaita' 
    'gobject-introspection-runtime' 
    'python' 
    'python-gobject' 
    'ffmpeg'
    'glib2'
)
optdepends=(
  'libcanberra: play system notification sounds'
  'sound-theme-freedesktop: standard system sounds like "complete.oga"'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'glib2'
)
source=(
	"https://git.jeena.net/api/v1/repos/jeena/recoder/archive/743b476d38f1bfbce0a512b705a1ab78fbd714f4.tar.gz"
)
sha256sums=('281d67690315dc7c6e22166f88c925cf164daa14fc0cb414f8d7452da14e29aa')

build() {
    cd "$srcdir/recoder"

    glib-compile-resources src/resources/resources.xml \
        --target=src/recoder/resources.gresource \
        --sourcedir=src/resources
    
    python -m build --wheel --outdir dist
}

package() {
    cd "$srcdir/recoder"
    
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 src/resources/net.jeena.Recoder.desktop \
        "$pkgdir/usr/share/applications/net.jeena.Recoder.desktop"
    install -Dm644 src/resources/net.jeena.Recoder.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.jeena.Recoder.svg"
    install -Dm644 src/resources/net.jeena.recoder.gschema.xml \
        "$pkgdir/usr/share/glib-2.0/schemas/net.jeena.recoder.gschema.xml"
    install -Dm644 src/resources/net.jeena.Recoder.metainfo.xml \
        "$pkgdir/usr/share/metainfo/net.jeena.Recoder.metainfo.xml"
}

install=recoder.install
