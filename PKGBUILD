# $Id$
# Maintainer: Realex
# Based on cinnamon-session PKGBUILD

_pkgname=cinnamon-session
pkgname=${_pkgname}-git
pkgver=126.8c1b918
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=('cinnamon-desktop-git' 'upower' 'libcanberra' 'libsm')
makedepends=('intltool' 'mesa' 'json-glib' 'xtrans' 'gnome-common' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!emptydirs')
install=${pkgname}.install
url="http://cinnamon.linuxmint.com/"
source=(${_pkgname}::git+https://github.com/linuxmint/cinnamon-session.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_pkgname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/cinnamon-session \
      --sbindir=/usr/bin --disable-schemas-compile --enable-systemd
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
