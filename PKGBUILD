# Paquete de Arch de morgan, la última versión ya compilada: baja el tarball que publica
# .github/workflows/release.yml en cada etiqueta vX.Y.Z (el árbol de /usr y /etc que arma
# dist/empaquetar, el mismo de morgan-git). Para compilar desde main: morgan-git.
#
#   makepkg -si
#
# Lo que el paquete no puede hacer por cada usuario lo hace `morgan setup` (lo dice
# morgan.install al instalar).

pkgname=morgan-bin
_nombre=morgan
pkgver=0.3.5
pkgrel=1
pkgdesc='Shell de escritorio para Hyprland: barra, centro de control, notificaciones, launcher, OSD y bloqueo (binario)'
arch=('x86_64')
url='https://github.com/ImJustDoingMyPart/morgan'
# El código, GPL; el tema y las plantillas de /usr/share/morgan, MIT (con sus créditos).
license=('GPL-3.0-or-later' 'MIT')
depends=(
    'hyprland>=0.56'
    'libpulse'
    'libpipewire'
    'glib2'
    'libxkbcommon'
    'fontconfig'
    # Los íconos de la interfaz son glifos de esta fuente.
    'ttf-jetbrains-mono-nerd'
    # El motor dibuja con wgpu, que carga Vulkan al arrancar.
    'vulkan-icd-loader'
    'pam'
    'systemd'
    'curl'
    'wl-clipboard'
)
optdepends=(
    'matugen: temas (también los curados: las plantillas pasan por matugen)'
    'awww: fondos de pantalla'
    'libvips: miniaturas de la banda de fondos'
    'hyprsunset: luz nocturna'
    'ddcutil: brillo de monitores externos (DDC/CI)'
    'upower: nivel de batería en notebooks'
    'hyprshot: capturas de pantalla'
    'cliphist: launcher, portapapeles'
    'wtype: launcher, escribir símbolos'
    'libqalculate: calculadora'
    'cava: ecualizador del reproductor en el centro de control'
    'libcanberra: sonidos del sistema'
    'uwsm: lanzar apps como unidades de systemd'
    'gpu-screen-recorder-ui: indicador y control de grabación'
    'papirus-folders: color de las carpetas del tema de íconos'
    'greetd: morgan-greet, la pantalla de inicio de sesión'
    'xdg-desktop-portal-gtk: que navegadores y apps de Electron sigan el modo claro u oscuro'
    'jq: morgan-cuota (cuotas de Claude Code y Antigravity) y umbriel-ciclar (atajos que ciclan apps en Umbriel)'
)
provides=("morgan=$pkgver" 'notification-daemon')
conflicts=('morgan' 'morgan-git')
backup=('etc/pam.d/morgan-lock')
options=('!strip' '!debug')
install=morgan.install
source=("$_nombre-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_nombre-$pkgver-x86_64.tar.gz")
sha256sums=('b6f5617fbd8b6afadd1fc685d5db7b03b6eb3b238eac23c622dcd0539baa6c07')

package() {
    cp -a --no-preserve=ownership "$_nombre-$pkgver-x86_64"/. "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/morgan" "$pkgdir/usr/share/licenses/$pkgname"
}
