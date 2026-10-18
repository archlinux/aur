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
pkgver=0.1.0
pkgrel=1
pkgdesc='Shell de escritorio para Hyprland: barra, centro de control, notificaciones, launcher, OSD y bloqueo (binario)'
arch=('x86_64')
url='https://github.com/ImJustDoingMyPart/morgan'
# El código, GPL; el tema y las plantillas de /usr/share/morgan, MIT (con sus créditos).
license=('GPL-3.0-or-later' 'MIT')
depends=(
    'hyprland>=0.56'
    'gtk4>=1:4.22'
    'gtk4-layer-shell'
    'libpulse'
    'glib2'
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
    'hyprshot: capturas de pantalla'
    'cliphist: launcher, portapapeles'
    'wtype: launcher, escribir símbolos'
    'libqalculate: calculadora'
    'rofimoji: launcher, datos de los símbolos'
    'libcanberra: sonidos del sistema'
    'uwsm: lanzar apps como unidades de systemd'
    'gpu-screen-recorder-ui: indicador y control de grabación'
    'papirus-folders: color de las carpetas del tema de íconos'
    'jq: morgan-cuota (cuotas de Claude Code y Antigravity)'
)
provides=("morgan=$pkgver" 'notification-daemon')
conflicts=('morgan' 'morgan-git')
backup=('etc/pam.d/morgan-lock')
options=('!strip' '!debug')
install=morgan.install
source=("$_nombre-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_nombre-$pkgver-x86_64.tar.gz")
sha256sums=('6c84a3d98bc3303a1277dd9e0dfbd6d4ca67ca5ff739b7cf0dacdce4b8eadd88')

package() {
    cp -a --no-preserve=ownership "$_nombre-$pkgver-x86_64"/. "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/morgan" "$pkgdir/usr/share/licenses/$pkgname"
}
