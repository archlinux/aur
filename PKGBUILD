# Maintainer: olalbns <olalbns@gmail.com>
pkgname=quick-control-git
_pkgname=Quick-Control
pkgver=r5.g3e9932d
pkgrel=1
pkgdesc='Compact GTK quick control center for Linux desktops'
arch=('any')
url='https://github.com/olalbns/Quick-Control'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'networkmanager: Wi-Fi status and toggle through nmcli'
  'bluez-utils: Bluetooth status and toggle through bluetoothctl'
  'wireplumber: PipeWire volume and microphone control through wpctl'
  'brightnessctl: screen and keyboard backlight controls'
  'upower: battery status'
  'hyprlock: lock screen support on Hyprland'
)
provides=('quick-control')
conflicts=('quick-control')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
