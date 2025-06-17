# Maintainer: Tu Nombre <tu.email@ejemplo.com>
pkgname=nautilus-file-explorer
pkgver=1.0.0
pkgrel=1
pkgdesc="Explorador de archivos gráfico estilo Nautilus con controles de sistema"
arch=('any')
url="https://github.com/Rodopqsi/nautilus-file-explorer"
license=('GPL3')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'glib2'
    'gdk-pixbuf2'
    'networkmanager'
    'pulseaudio'
    'pulseaudio-alsa'
)
optdepends=(
    'xorg-xbacklight: Control de brillo con xbacklight'
    'brightnessctl: Control de brillo alternativo'
    'vlc: Reproductor multimedia'
    'gstreamer: Soporte multimedia integrado'
    'gst-plugins-base: Códecs básicos'
    'gst-plugins-good: Códecs adicionales'
    'gst-plugins-bad: Códecs menos comunes'
    'gst-libav: Soporte para formatos adicionales'
)
makedepends=('python-setuptools')
source=("git+https://github.com/Rodopqsi/nautilus-file-explorer.git#tag=v1.0.0")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    
    # Instalar archivo .desktop
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Instalar icono si existe
    if [ -f "icon.png" ]; then
        install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi
}