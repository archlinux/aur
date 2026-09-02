# Maintainer: Movacx <movacx@users.noreply.github.com>

pkgname=bc250-control-center-git
pkgver=1.19.0.r57.g07a7e6f
pkgrel=1
pkgdesc='BC-250 monitoring, tuning and recovery control center'
arch=('any')
url='https://github.com/movacx/bc250-control-center'
license=('MIT')
depends=(
  'bash'
  'python'
  'python-pyqt6'
  'python-psutil'
  'qt6-svg'
  'polkit'
  'jq'
  'git'
  'pciutils'
  'kmod'
)
makedepends=('git')
optdepends=(
  'lm_sensors: additional hardware sensor discovery'
  'stress: CPU tuning stability checks'
  'vulkan-tools: Vulkan capability diagnostics'
  'mesa-utils: OpenGL diagnostics'
  'libdrm: optional BC-250 GPU runtime and source-built tools'
  'curl: download optional upstream BC-250 tools'
  'tar: unpack optional upstream BC-250 tools'
  'zstd: unpack optional upstream BC-250 tools'
  'base-devel: build optional AUR or upstream BC-250 components'
  'cmake: build optional source-based GPU components'
  'pkgconf: build optional source-based GPU components'
  'cyan-skillfish-governor-smu: SMU/D-Bus GPU governor support for BC-250'
  'umr: AMDGPU register access for the 40 CU live manager'
  'libnotify: desktop notifications through notify-send'
  'python-evdev: preferred Linux gamepad input backend'
  'nct6687d-dkms-git: experimental PWM fan control on BC-250'
)
provides=("bc250-control-center=${pkgver}")
conflicts=('bc250-control-center')
source=('git+https://github.com/movacx/bc250-control-center.git#branch=main')
sha256sums=('SKIP')
install=bc250-control-center.install

pkgver() {
  cd "$srcdir/bc250-control-center"
  local version revision commit
  version="$(tr -d '[:space:]' < VERSION)"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s\n' "$version" "$revision" "$commit"
}

package() {
  cd "$srcdir/bc250-control-center"
  bash packaging/scripts/stage-package-root.sh "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
