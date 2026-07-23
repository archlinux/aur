# Maintainer: Sergi122 <sergiopoma42@gmail.com>
pkgname=animalinux
# el repo de GitHub se llama distinto al paquete: el tarball de un tag se
# extrae como "AnimalinuxApp-$pkgver", no "$pkgname-$pkgver" — sin esto
# build()/package() fallan con "No such file or directory" (bug real,
# presente desde v0.2.0, nunca se había probado con una build de verdad).
_gitname=AnimalinuxApp
pkgver=0.4.4
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
    'python-xlib'
    'gtk4-layer-shell'
    'libayatana-appindicator'
)
optdepends=(
    'python-numpy: rendimiento mejorado de pinceles y blend modes'
    'mpv: reproducción de audio en el editor de animación'
    'ffmpeg: exportar animaciones como MP4'
    'python-rembg: recorte de fondo con IA (requiere onnxruntime)'
    'python-onnxruntime: motor IA para rembg'
    'libwnck3: andar por bordes de ventana y pausa en pantalla completa (backend X11: GNOME/KDE/Xfce/MATE/Cinnamon)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6887b3c167d11116984aa486b410815f221d67d02caf84f26662f098e49f950')

build() {
    cd "$_gitname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_gitname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 animalinux.desktop "$pkgdir/usr/share/applications/animalinux.desktop"
    install -Dm644 animalinux.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/animalinux.png"
}
