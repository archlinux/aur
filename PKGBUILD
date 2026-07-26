# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
# Contributor: honjow

pkgname=vboard
pkgver=2.7.0
pkgrel=1
pkgdesc='Wayland virtual keyboard for GNU/Linux with modifier key support'
arch=('any')
url='https://github.com/archisman-panigrahi/vboard'
license=('GPL3')
install="${pkgname}.install"
depends=(
  'python'
  'python-gobject'
  'gtk3'
  'python-uinput'
  'libayatana-appindicator'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)
optdepends=(
  'desktop-file-utils: provides update-desktop-database for helper scripts'
  'hunspell-en_us: enables word suggestions'
)
source=("${pkgname}::git+https://github.com/archisman-panigrahi/vboard.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  meson install -C build --destdir "${pkgdir}"
}
