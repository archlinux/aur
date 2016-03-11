# Maintainer: Mustafa Gezen <mustiigezen@gmail.com>
pkgname=("zx-git")
srcname="zx"
pkgver="1.0"
pkgrel="1"
pkgdesc="i3 scratchpad manager"
arch=("any")
url="https://github.com/mstg/zx"
license=('MIT')
depends=("glib2")
makedepends=("libxcb")
provides=("zx")
conflicts=("zx")
source=("http://github.com/mstg/zx/archive/v$pkgver.tar.gz")
sha512sums=("SKIP")

build() {
  if [ ! -n "$(pacman -Qs i3ipc-glib-git)" ]; then
    curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/i3ipc-glib-git.tar.gz
    tar -xvf i3ipc-glib-git.tar.gz
    cd i3ipc-glib-git
    makepkg -sri
    cd ..
  fi

  cd "zx-$pkgver"
  make
}

package() {
  cd "zx-$pkgver"

  sudo make install
}
