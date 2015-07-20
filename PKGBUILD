# Maintainer: Morris Jobke <hey at morrisjobke dot de>
# Contributor: alucryd <alucryd at gmail dot com>

pkgname=gnome-shell-extension-mediaplayer-git
pkgver=3.10.r445.2b62dc0
pkgrel=1
pkgdesc='A mediaplayer indicator for the Gnome Shell'
arch=('any')
url='https://github.com/eonpatapon/gnome-shell-extensions-mediaplayer'
license=('GPL2')
depends=('gnome-shell')
makedepends=('git' 'gnome-common' 'intltool')
optdepends=('mpdris2-git: MPD support')
install=${pkgname%-*}.install
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "3.10.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh
  ./configure --prefix='/usr' --disable-schemas-compile
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
