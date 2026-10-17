# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=gnome-shell-extension-gfs-git
pkgver=r31.2229d05
pkgrel=1
pkgdesc="GNOME extension to fast switch between windows using keybindings."
arch=('x86_64')
url="https://github.com/vncsmyrnk/gfs"
license=('GPL-3.0')
depends=('glib2' 'gnome-shell')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd gfs || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gfs || return
  autoreconf -fi
  ./configure
}

package() {
  cd gfs || return
  make install DESTDIR="$pkgdir"
}
