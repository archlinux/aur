# See AUR interface for current maintainer
# Edited to include libxnvctrl dependancy
# Based on http://xfce.10915.n7.nabble.com/NVidia-data-td16172.html
# also based on arch bug report https://bugs.archlinux.org/task/25548

# Maintainer:  FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

_pkgname=xfce4-sensors-plugin
pkgname=xfce4-sensors-plugin-nvidia
pkgver=1.5.0
pkgrel=2
pkgdesc="A lm_sensors plugin for the Xfce panel with nvidia gpu support"
arch=('i686' 'x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
license=('GPL-2.0-or-later')
depends=('xfce4-panel' 'lm_sensors' 'libnotify' 'hicolor-icon-theme' 'libxnvctrl')
makedepends=('meson' 'ninja')
optdepends=(
  'hddtemp: Use hddtemp to read your harddisk temperature'
  'netcat: Use netcat to read your hddtemp temperature'
)
source=(
  https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
)
sha256sums=('840442b87fdddcd8595bd9f83ea8b81f771fe296bb9d2abf0e1979e208727ae9')

prepare() {
  meson subprojects download --sourcedir="$srcdir/$_pkgname-$pkgver"
}

build() {
  arch-meson "$srcdir/$_pkgname-$pkgver" build -Dxnvctrl=enabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
