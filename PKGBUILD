# Maintainer: Sergi122 <sergiopoma42@gmail.com>
pkgname=animalinux
pkgver=0.3.0
pkgrel=1
pkgdesc="Mascotas animadas en el escritorio para Hyprland/Wayland, con editor de píxeles y pintura"
arch=('x86_64' 'aarch64')
url="https://github.com/Sergi122/AnimalinuxApp"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'python-pillow'
    'gtk4-layer-shell'
    'libayatana-appindicator'
)
optdepends=(
    'python-numpy: rendimiento mejorado de pinceles y blend modes'
    'mpv: reproducción de audio en el editor de animación'
    'ffmpeg: exportar animaciones como MP4'
    'python-rembg: recorte de fondo con IA (requiere onnxruntime)'
    'python-onnxruntime: motor IA para rembg'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('51bfc2783253784addcd5477aa52f7221e94b7255262699f8cc37f48ed6981a4')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 animalinux.desktop "$pkgdir/usr/share/applications/animalinux.desktop"
    install -Dm644 animalinux.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/animalinux.png"
}
