# Maintainer: earthian <418@duck.com>

pkgname=rofi-pass-wayland-git
pkgver=2.1.3.r0.gcab4a78
pkgrel=1
pkgdesc="Rofi-wayland frontend for ZX2C4 pass project."
arch=('any')
url="https://github.com/Seme4eg/rofi-pass-wayland"
license=('GPL-3.0-or-later')
depends=(
  # official repositories:
  'pass' 'wtype' 'wl-clipboard'
  # AUR:
  'rofi-lbonn-wayland-git'
)
optdepends=('qrencode: qrcode functionality'
  'pass-otp: one time passwords generation')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}" 'rofi-pass-git' 'rofi-pass-ydotool-git')
source=('git+https://github.com/Seme4eg/rofi-pass-wayland')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
