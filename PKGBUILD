# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=gnome-shell-extension-gsconnect-git
pkgver=54.r11.ga7c3fef6
pkgrel=1
pkgdesc="KDE Connect implementation with GNOME Shell integration"
arch=('any')
url="https://github.com/GSConnect/gnome-shell-extension-gsconnect"
license=('GPL')
depends=('gnome-shell')
optdepends=('folks: Contacts integration (Evolution)'
            'libgdata: Contacts integration (GNOME Online Accounts)'
            'python-nautilus: Nautilus integration'
            'gsound: Themed sound effects')
makedepends=('git' 'meson' 'eslint')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}


build() {
  cd "${pkgname%-git}"
  arch-meson --buildtype=plain build
  ninja -C build
}

check() {
  cd "${pkgname%-git}"
  arch-meson check 
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=4 sw=4 et:
