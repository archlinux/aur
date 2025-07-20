# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pop-sound-theme-git
pkgver=5.5.1.r7.g25ea85d
pkgrel=1
pkgdesc="System76 Pop sound theme"
arch=('any')
url="https://github.com/pop-os/gtk-theme"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'setconf'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'pop-gtk-theme')
source=('git+https://github.com/pop-os/gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd gtk-theme
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gtk-theme/sounds/src
  setconf index.theme.in Name "Pop"
  setconf index.theme.in Comment "The Pop Sound Theme"
}

package() {
  cd gtk-theme
  install -Dm644 sounds/src/index.theme.in "$pkgdir/usr/share/sounds/Pop/index.theme"
  cp -r sounds/src/stereo "$pkgdir/usr/share/sounds/Pop"
}
